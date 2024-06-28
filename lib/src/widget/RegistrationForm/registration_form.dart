// lib/src/widget/RegistrationForm/registration_form.dart
import 'package:flutter/material.dart';
import 'package:task_track/src/services/auth_service.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class RegistrationForm extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final UserService authService =
      UserService(baseUrl: 'http://172.18.0.5:3000');

  RegistrationForm({
    super.key,
    required this.userController,
    required this.emailController,
    required this.passwordController,
  });

  void _registerUser(BuildContext context) async {
    try {
      var response = await authService.register(
        userController.text,
        emailController.text,
        passwordController.text,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register user: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register user: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _registerUser(context),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerRight,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
