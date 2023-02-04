import 'dart:async';

import 'package:estado_app/models/usuario.dart';

class _UsuarioServices {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;
  Usuario? get usuario => this._usuario;

  bool get exiteUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario value) {
    this._usuario = value;
    _usuarioStreamController.add(value);
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    _usuarioStreamController.add(_usuario!);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioServices = _UsuarioServices();
