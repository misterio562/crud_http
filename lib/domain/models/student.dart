class Student {
  late int id;
  late String foto;
  late String nombre;
  late String apellido;
  late String programa;
  late int idUser;

  Student(
      {required this.id,
      required this.foto,
      required this.nombre,
      required this.apellido,
      required this.programa,
      required this.idUser});

  factory Student.desdeJson(Map<String, dynamic> jsonMap) {
    return Student(
      id: int.parse(jsonMap['id']),
      foto: jsonMap['foto'],
      nombre: jsonMap['nombre'],
      apellido: jsonMap['apellido'],
      programa: jsonMap['programa'],
      idUser: int.parse(jsonMap['iduser']),
    );
  }
}
