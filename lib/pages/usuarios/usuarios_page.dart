import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_demo/pages/usuarios/add_usuario_page.dart';
import 'package:flutter_api_demo/pages/usuarios/usuarios_controller.dart';
import 'package:provider/provider.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  late UsuariosController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<UsuariosController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UsuariosController>().loadUsuarios(),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddUsuarioPage(),
                fullscreenDialog: true,
              ),
            ),
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: ValueListenableBuilder<Status>(
          valueListenable: controller.status,
          builder: (context, status, _) {
            final usuarios = controller.usuarios;

            if (status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.separated(
              itemCount: usuarios.length,
              itemBuilder: (context, int index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image(
                      image: CachedNetworkImageProvider(
                        usuarios[index].avatar ?? controller.avatarDefault,
                      ),
                    ),
                  ),
                ),
                title: Text(usuarios[index].name),
                subtitle: Text(usuarios[index].email),
                trailing: IconButton(
                  icon: controller.currentUsuarioIndex == index
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : const Icon(Icons.delete),
                  onPressed: () => controller.removeUsuario(index),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }),
    );
  }
}
