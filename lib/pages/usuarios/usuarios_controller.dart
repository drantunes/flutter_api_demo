import 'package:flutter_api_demo/entities/usuario.dart';
import 'package:flutter_api_demo/repositories/usuarios_repository.dart';

class UsuariosController {
  List<Usuario> usuarios = [];
  UsuariosRepository usuariosRepository;

  String get avatarDefault => 'https://www.ecp.org.br/wp-content/uploads/2017/12/default-avatar-300x300.png';

  UsuariosController({required this.usuariosRepository}) {
    usuariosRepository.addListener(() {
      usuarios = usuariosRepository.usuarios;
    });
  }
}
