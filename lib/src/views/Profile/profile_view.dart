import 'package:flutter/material.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/widget/CustomButton/custom_button.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class MyProfileView extends StatefulWidget {
  MyProfileView({Key? key}) : super(key: key);

  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEditing = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(AVATAR_IMAGE),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nome do Usuário',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Dados da conta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: _buildProfileForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileForm() {

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        IgnorePointer(
          ignoring: !isEditing,
          child: CustomTextField(
            controller: nameController,
            hintText: 'Digite seu nome',
            labelText: 'Nome',
          ),
        ),
        const SizedBox(height: 16),
        IgnorePointer(
          ignoring: !isEditing,
          child: CustomTextField(
            controller: emailController,
            hintText: 'Digite seu email',
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 16),
        IgnorePointer(
          ignoring: !isEditing,
          child: CustomTextField(
            controller: passwordController,
            hintText: 'Digite sua senha',
            labelText: 'Senha',
            obscureText: _obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 50),
        CustomButton(
          text: 'Editar',
          textStyle: TextStyle(
            fontSize: 30,
            color: Colors.brown[200],
          ),
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
        CustomButton(
          text: 'Salvar',
          textStyle: TextStyle(
            fontSize: 30,
            color: Colors.brown[200],
          ),
          onPressed: () {
            // Implementar a lógica para salvar os dados do usuário
          },
        ),
      ],
    );
  }
}
