class Usuario {
  final String nombre;
  late final int? edad;
  final List<String>? profesiones;

  Usuario({required this.nombre, this.edad, this.profesiones});

  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) {
    return Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones);
  }
}
