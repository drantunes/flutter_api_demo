import 'package:flutter_api_demo/pages/usuarios/usuarios_controller.dart';
import 'package:flutter_api_demo/repositories/usuarios_repository.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<UsuariosRepository>(
    create: (context) => UsuariosRepository(),
  ),
  Provider<UsuariosController>(
    create: (context) => UsuariosController(usuariosRepository: context.read<UsuariosRepository>()),
  ),
];
