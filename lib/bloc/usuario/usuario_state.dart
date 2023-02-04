part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class Usuarioinitial extends UsuarioState {
  final existeUsiario = false;

  // @override
  // String toString() {
  //   return 'Usuario Inicial : existeUsiario: false';
  // }
}

class UsuarioActivo extends UsuarioState {
  final existeUsiario = true;

  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
