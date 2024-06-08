import 'package:flutter/material.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class RegistrationForm extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegistrationForm({
    super.key, 
    required this.userController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[
          CustomTextField(
            controller: userController,
            hintText: "Digite seu nome",
            labelText: 'Nome',
          ),
          CustomTextField(
            controller: emailController,
            hintText: "Digite seu email",
            labelText: 'Email',
          ),
          const SizedBox(height: 16.0),
          CustomTextField(
            controller: passwordController,
            hintText: "Digite sua senha",
            labelText: 'Senha',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
