import 'package:estado_app/models/usuario.dart';
import 'package:estado_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioServices.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return Container(
              child: snapshot.hasData
                  ? Text(usuarioServices.usuario!.nombre)
                  : Text('No existe'),
            );
          },
        ),
        centerTitle: true,
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
                final nuevoUsuario = Usuario(nombre: 'Fernando', edad: 30);
                usuarioServices.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioServices.cambiarEdad(35);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
