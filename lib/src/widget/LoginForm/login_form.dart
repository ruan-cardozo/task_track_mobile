import 'package:flutter/material.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key, 
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: emailController,
              hintText: "Digite seu email",
              labelText: 'Email',
            ),
            CustomTextField(
              controller: passwordController,
              hintText: "Digite sua senha",
              labelText: 'Senha',
              obscureText: true,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(67, 54, 51, 100),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ));
  }
}
