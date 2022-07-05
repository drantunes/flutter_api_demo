import 'package:flutter_api_demo/entities/user.dart';
import 'dart:convert';

class UserTransformer {
  static String toJson(User user) => json.encode(toMap(user));

  static User fromJson(String source) => fromMap(json.decode(source));

  static Map<String, dynamic> toMap(User user) {
    return {
      'name': user.name,
      'email': user.email,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
