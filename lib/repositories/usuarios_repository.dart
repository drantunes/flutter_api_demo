import 'package:flutter_api_demo/entities/usuario.dart';

class UsuariosRepository {
  List<Usuario> usuarios = [];

  UsuariosRepository();

  Future<List<Usuario>> getAll() async {
    return usuarios;
  }

  Future<void> store(String name, String email) async {}

  Future<void> delete(Usuario usuario) async {}
}
