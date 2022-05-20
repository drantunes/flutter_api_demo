import 'package:flutter/material.dart';
import 'package:flutter_api_demo/entities/usuario.dart';
import 'package:flutter_api_demo/repositories/usuarios_repository.dart';

enum Status { loading, updating, success, error }

class UsuariosController {
  List<Usuario> usuarios = [];
  UsuariosRepository usuariosRepository;
  ValueNotifier<Status> status = ValueNotifier(Status.loading);
  int currentUsuarioIndex = -1;

  String avatarDefault = 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-64.png';

  UsuariosController({required this.usuariosRepository}) {
    loadUsuarios();
  }

  loadUsuarios() async {
    status.value = Status.loading;
    usuarios = await usuariosRepository.getAll();
    status.value = Status.success;
  }

  removeUsuario(int usuarioIndex) async {
    currentUsuarioIndex = usuarioIndex;
    status.value = Status.updating;

    await usuariosRepository.delete(usuarios[usuarioIndex]);
    usuarios = usuariosRepository.usuarios;

    currentUsuarioIndex = -1;
    status.value = Status.success;
  }

  addUsuario(String name, String email) async {
    status.value = Status.updating;
    await usuariosRepository.store(name, email);
    usuarios = usuariosRepository.usuarios;
    status.value = Status.success;
  }
}
