
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback loginUser; // Passar função loginUser como parâmetro

  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.loginUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromRGBO(67, 54, 51, 100),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromRGBO(67, 54, 51, 100),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(67, 54, 51, 100),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loginUser, // Use a função loginUser passada como parâmetro
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerRight,
                backgroundColor: const Color.fromRGBO(67, 54, 51, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(222, 203, 183, 100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
