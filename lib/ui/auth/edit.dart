import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/ui/content/student/listaStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/student.dart';

class EditStudentModal extends StatefulWidget {
  final int index;
  final VoidCallback reload;

  const EditStudentModal({
    super.key,
    required this.index,
    required this.reload,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditStudentModalState createState() => _EditStudentModalState();
}

class _EditStudentModalState extends State<EditStudentModal> {
  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _programaController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _programaController.dispose();
    super.dispose();
  }

  void cargarDatos(Student student) {
    _nombreController = TextEditingController(text: student.nombre);
    _apellidoController = TextEditingController(text: student.apellido);
    _programaController = TextEditingController(text: student.programa);
  }

  @override
  Widget build(BuildContext context) {
    final ControlStudent controle = Get.find();
    final student = controle.listaStudentGral![widget.index];
    cargarDatos(student);

    return AlertDialog(
      title: const Text('Editar estudiante'),
      content: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                ),
              ),
              TextFormField(
                controller: _programaController,
                decoration: const InputDecoration(
                  labelText: 'Programa',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            controle
                .updateStudent(student.id, _nombreController.text,
                    _apellidoController.text, _programaController.text)
                .then((value) {
              Get.snackbar('Estudiante', controle.listaMensajes![0].mensaje,
                  duration: const Duration(seconds: 2),
                  icon: const Icon(Icons.info),
                  shouldIconPulse: true,
                  backgroundColor: Colors.green);
            });
            widget.reload();
            Navigator.of(context).pop();
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
