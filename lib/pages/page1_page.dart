import 'dart:ui';

import 'package:estado_app/models/usuario.dart';
import 'package:estado_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: usuarioServices.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return Container(
            child: //usuarioServices.exiteUsuario
                snapshot.hasData
                    ? InformacionUsuario(
                        usuario: usuarioServices.usuario!,
                      )
                    : Center(
                        child: Text('No hay informacion'),
                      ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

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
          ListTile(
            title: Text('Profesion1:'),
          ),
          ListTile(
            title: Text('Profesion1:'),
          ),
        ],
      ),
    );
  }
}
