import 'package:flutter/foundation.dart';
import 'package:flutter_api_demo/entities/usuario.dart';

class UsuariosRepository extends ChangeNotifier {
  List<Usuario> usuarios = [];

  UsuariosRepository();

  Future<List<Usuario>> getAll() async {
    return [];
  }

  // Future<Usuario> getById(String id) async {}

  Future<void> store(Usuario usuario) async {}

  Future<void> delete(Usuario usuario) async {}
}
