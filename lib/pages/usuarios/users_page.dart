import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_demo/pages/usuarios/add_user_page.dart';
import 'package:flutter_api_demo/pages/usuarios/users_controller.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late UsersController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<UsersController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UsersController>().loadUsers(),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddUserPage(),
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
          final usuarios = controller.users;

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
                icon: controller.currentUserIndex == index
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Icon(Icons.delete),
                onPressed: () => controller.removeUser(index),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
