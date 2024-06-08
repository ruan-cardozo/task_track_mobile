import 'package:flutter/material.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart'; // Certifique-se de que este arquivo existe e contém a constante AVATAR_IMAGE

class MyProfileView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  MyProfileView({super.key});

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
            const SizedBox(height: 60), 
            const CircleAvatar(
              radius: 150,
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
            _buildProfileForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: nameController,
            hintText: 'Digite seu nome',
            labelText: 'Nome',
          ),
          const SizedBox(
              height: 16), // Espaçamento entre os campos do formulário
          CustomTextField(
            controller: emailController,
            hintText: 'Digite seu email',
            labelText: 'Email',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            hintText: 'Digite sua senha',
            labelText: 'Senha',
            obscureText: true, // Para esconder o texto da senha
          ),
        ],
      ),
    );
  }
}
