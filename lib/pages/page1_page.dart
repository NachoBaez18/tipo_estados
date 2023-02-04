import 'dart:ui';

import 'package:estado_app/models/usuario.dart';
import 'package:estado_app/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: usuarioService.existeUsuario
                ? () {
                    usuarioService.borrarUsuario();
                  }
                : null,
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : const Center(
              child: Text('No hay usuarrio'),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ...usuario.profesiones!
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
          // ListTile(
          //   title: Text('Profesion1:'),
          // ),
          // ListTile(
          //   title: Text('Profesion1:'),
          // ),
        ],
      ),
    );
  }
}
