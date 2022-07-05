import 'package:flutter/material.dart';
import 'package:flutter_api_demo/pages/usuarios/users_controller.dart';
import 'package:provider/provider.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  salvar() async {
    final controller = Provider.of<UsersController>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      await controller.addUser(_name.text, _email.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Usuário'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o nome do usuário!';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o email do usuário!';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: salvar,
                    child: const Text('Salvar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
