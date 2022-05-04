import 'package:flutter/material.dart';
import 'package:flutter_api_demo/pages/usuarios/usuarios_controller.dart';
import 'package:provider/provider.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add)),
        ],
      ),
      body: Consumer<UsuariosController>(builder: (context, controller, _) {
        return ListView.separated(
          itemCount: controller.usuarios.length,
          itemBuilder: (context, int index) => ListTile(
            leading: CircleAvatar(
              child: Image.network(
                controller.usuarios[index].avatar ?? controller.avatarDefault,
              ),
            ),
            title: Text(controller.usuarios[index].name),
            subtitle: Text(controller.usuarios[index].email),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        );
      }),
    );
  }
}
