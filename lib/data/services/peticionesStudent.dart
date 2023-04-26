import 'dart:convert';

import 'package:crud_http/domain/models/student.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../../domain/models/utiles.dart';

class PeticionesStudent {
  static Future<List<Student>> getListStudent() async {
    var url = Uri.parse(
        "https://busetp.000webhostapp.com/APISTUDENT/listaStudent.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Student> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Student>((json) => Student.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> deleteStudent(int id) async {
    var url = Uri.parse(
      "https://busetp.000webhostapp.com/APISTUDENT/deleteStudent.php",
    );

    final response = await http.post(url, body: {'id': id.toString()});

    print(response.statusCode);
    print(response.body);
    return compute(convertirListaDelete, response.body);
  }

  static List<Mensajes> convertirListaDelete(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Mensajes>> updateStudent(
      int id, String n, String a, String p) async {
    var url = Uri.parse(
        "https://busetp.000webhostapp.com/APISTUDENT/updateStudent.php");
    final response = await http
        .post(url, body: {"id": id.toString(), "nombre": n, "apellido": a, "programa": p});
    return compute(convertirListaUpdate, response.body);
  }

  static List<Mensajes> convertirListaUpdate(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }
}
