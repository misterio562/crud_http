import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:crud_http/ui/auth/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  void initState() {
    super.initState();
    updateList();
  }

  void updateList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ControlStudent controle = Get.find();
    final ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estudiantes"),
      ),
      body: ListView.builder(
        itemCount: controle.listaStudentGral!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controle.listaStudentGral![index].foto),
            ),
            title: Text(
                "${controle.listaStudentGral![index].nombre} ${controle.listaStudentGral![index].apellido}"),
            subtitle: Text(controle.listaStudentGral![index].programa),
            trailing: (controle.listaStudentGral![index].idUser ==
                    controlu.listaUserLogin![0].id)
                ? PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Editar'),
                          onTap: () {
                            // Lógica para editar el estudiante
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => EditStudentModal(
                                      index: index,
                                      reload: updateList,
                                    ));
                            print(controle.listaStudentGral![index]);
                            print(index);
                            print(controle.listaStudentGral![index].id);
                            
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Eliminar'),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirmar eliminación'),
                                    content: const Text(
                                        '¿Está seguro que desea eliminar el estudiante?'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar')),
                                      TextButton(
                                          onPressed: () {
                                            // Lógica para eliminar el estudiante
                                            controle
                                                .deleteStudent(controle
                                                    .listaStudentGral![index]
                                                    .id)
                                                .then((value) {
                                              Get.snackbar(
                                                  'Estudiante',
                                                  controle.listaMensajes![0]
                                                      .mensaje,
                                                  duration: const Duration(
                                                      seconds: 2),
                                                  icon: const Icon(Icons.info),
                                                  shouldIconPulse: true,
                                                  backgroundColor:
                                                      Colors.green);
                                            });

                                            setState(() {
                                              controle.listaStudentGral!
                                                  .removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                            
                                          },
                                          child: const Text('Eliminar'))
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.settings),
                  )
                : const Text(""),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => updateList(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
