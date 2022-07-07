import 'package:flutter/material.dart';
import 'package:flutter_api_demo/providers.dart';
import 'package:flutter_api_demo/services/auth_service.dart';
// import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          child: const Text('Entrar no App'),
          onPressed: () => getIt<AuthService>().login(),
        ),
      ),
    );
  }
}
