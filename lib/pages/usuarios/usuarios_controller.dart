import 'package:flutter/material.dart';
import 'package:flutter_api_demo/entities/usuario.dart';
import 'package:flutter_api_demo/repositories/usuarios_repository.dart';

enum Status { loading, updating, success, error }

class UsuariosController {
  List<Usuario> usuarios = [];
  UsuariosRepository usuariosRepository;
  int currentUsuarioIndex = -1;
  ValueNotifier<Status> status = ValueNotifier(Status.loading);

  String avatarDefault = 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-64.png';

  UsuariosController({required this.usuariosRepository});
}
