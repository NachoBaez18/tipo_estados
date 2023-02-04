import 'package:estado_app/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioServices with ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void borrarUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario!.profesiones!
        .add('Profesion ${_usuario!.profesiones!.length + 1}');
    notifyListeners();
  }
}
