import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_demo/entities/user.dart';

class DetailUserPage extends StatelessWidget {
  final User user;

  const DetailUserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(150)),
              child: Image(
                image: CachedNetworkImageProvider(user.avatar!),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(user.name),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(user.email),
          ),
        ],
      ),
    );
  }
}
