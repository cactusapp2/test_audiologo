import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyUsuarioPage extends StatefulWidget {
  const MyUsuarioPage({super.key});

  @override
  State<MyUsuarioPage> createState() => _MyUsuarioPageState();
}

class _MyUsuarioPageState extends State<MyUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Usuarios: Jose Luis"),
          Text("correo: jose@gmail.com"),
          Text("Registrado en: "+DateTime.now().year.toString()),
        ],
      ),
    );
  }
}