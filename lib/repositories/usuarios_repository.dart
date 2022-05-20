import 'dart:convert';

import 'package:flutter_api_demo/configs.dart';
import 'package:flutter_api_demo/entities/usuario.dart';
import 'package:flutter_api_demo/transformers/usuario_transformer.dart';
import 'package:http/http.dart' as http;

class UsuariosRepository {
  List<Usuario> usuarios = [];

  UsuariosRepository();

  Future<List<Usuario>> getAll() async {
    final url = Uri.parse('$BASE_API/usuarios');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final usuariosList = jsonDecode(response.body) as List;
      for (var usuario in usuariosList) {
        usuarios.add(UsuarioTransformer.fromMap(usuario));
      }
    }
    return usuarios;
  }

  Future<void> store(String name, String email) async {
    final url = Uri.parse('$BASE_API/usuarios');
    final response = await http.post(url, body: {'name': name, 'email': email});

    if (response.statusCode == 201) {
      final usuario = jsonDecode(response.body) as Map<String, dynamic>;
      usuarios.add(UsuarioTransformer.fromMap(usuario));
    }
  }

  Future<void> delete(Usuario usuario) async {
    final url = Uri.parse('$BASE_API/usuarios/${usuario.id}');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      usuarios.remove(usuario);
    }
  }
}
