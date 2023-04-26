import 'package:crud_http/data/services/peticionesStudent.dart';
import 'package:crud_http/domain/models/student.dart';

import 'package:get/get.dart';

import '../models/utiles.dart';


class ControlStudent extends GetxController {
  final Rxn<List<Student>> listaStudent = Rxn<List<Student>>([]);
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);


  Future<void> getStudentGral() async {
    listaStudent.value = await PeticionesStudent.getListStudent();
  }

  Future<void> deleteStudent(int id) async {
    _listarMensajes.value = await PeticionesStudent.deleteStudent(id);
  }

  Future<void> updateStudent(int id, String n, String a, String p) async {
    _listarMensajes.value = await PeticionesStudent.updateStudent(id, n, a, p);
    getStudentGral();
  }
  
  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Student>? get listaStudentGral => listaStudent.value;
}