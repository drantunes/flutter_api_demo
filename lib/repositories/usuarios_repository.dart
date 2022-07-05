import 'dart:convert';

import 'package:flutter_api_demo/configs.dart';
import 'package:flutter_api_demo/entities/user.dart';
import 'package:flutter_api_demo/transformers/user_transformer.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  List<User> users = [];

  UsersRepository();

  Future<List<User>> getAll() async {
    final url = Uri.parse('$BASE_API/usuarios');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final usersList = jsonDecode(response.body) as List;
      for (var user in usersList) {
        users.add(UserTransformer.fromMap(user));
      }
    }

    return users;
  }

  Future<void> store(String name, String email) async {
    final url = Uri.parse('$BASE_API/usuarios');
    final response = await http.post(url, body: {'name': name, 'email': email});

    if (response.statusCode == 201) {
      final user = jsonDecode(response.body) as Map<String, dynamic>;
      users.add(UserTransformer.fromMap(user));
    }
  }

  Future<void> delete(User user) async {
    final url = Uri.parse('$BASE_API/usuarios/${user.id}');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      users.remove(user);
    }
  }
}
