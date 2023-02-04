import 'package:estado_app/models/usuario.dart';
import 'package:estado_app/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioServices = Provider.of<UsuarioServices>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: usuarioServices.existeUsuario
            ? Text(usuarioServices.usuario.nombre)
            : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final usuarioServices =
                    Provider.of<UsuarioServices>(context, listen: false);
                final newUsuario = Usuario(
                    nombre: 'Fernando',
                    edad: 32,
                    profesiones: ['Developer', 'Gamer']);

                usuarioServices.usuario = newUsuario;
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final usuarioServices =
                    Provider.of<UsuarioServices>(context, listen: false);
                usuarioServices.cambiarEdad(20);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioServices.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
