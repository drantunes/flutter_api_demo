import 'package:flutter_api_demo/pages/users/users_controller.dart';
import 'package:flutter_api_demo/repositories/users_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<UsersRepository>(
    create: (context) => UsersRepository(),
  ),
  Provider<UsersController>(
    create: (context) => UsersController(
      usersRepository: context.read<UsersRepository>(),
    ),
  ),
];
