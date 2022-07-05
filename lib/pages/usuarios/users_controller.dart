import 'package:flutter/material.dart';
import 'package:flutter_api_demo/entities/user.dart';
import 'package:flutter_api_demo/repositories/usuarios_repository.dart';

enum Status { loading, updating, success, error }

class UsersController {
  List<User> users = [];
  UsersRepository usersRepository;
  ValueNotifier<Status> status = ValueNotifier(Status.loading);
  int currentUserIndex = -1;

  String avatarDefault = 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-64.png';

  UsersController({required this.usersRepository}) {
    loadUsers();
  }

  loadUsers() async {
    status.value = Status.loading;
    users = await usersRepository.getAll();
    status.value = Status.success;
  }

  removeUser(int userIndex) async {
    currentUserIndex = userIndex;
    status.value = Status.updating;

    await usersRepository.delete(users[userIndex]);
    users = usersRepository.users;

    currentUserIndex = -1;
    status.value = Status.success;
  }

  addUser(String name, String email) async {
    status.value = Status.updating;
    await usersRepository.store(name, email);
    users = usersRepository.users;
    status.value = Status.success;
  }
}
