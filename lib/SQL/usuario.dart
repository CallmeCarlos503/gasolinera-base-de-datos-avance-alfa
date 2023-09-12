class Usuario {
  final int id;
  final String Nombre;
  final String Correo;
  final String Contrasena;
  final String Telefono;

  Usuario(
      {required this.id,
      required this.Nombre,
      required this.Correo,
      required this.Contrasena,
      required this.Telefono});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Nombre': Nombre,
      'Correo': Correo,
      'Contrasena': Contrasena,
      'Telefono': Telefono
    };
  }
}
