import 'package:flutter/material.dart';
import 'package:task_track/src/views/Login/login_view.dart';
import 'package:task_track/src/widget/CustomTextField/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Campo de Email com ícone
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Color.fromRGBO(67, 54, 51, 100),),
              ),
            ),
            const SizedBox(height: 16), // Espaço vertical
            // Campo de Senha com ícone
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(67, 54, 51, 100),),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16), // Espaço vertical
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
            const SizedBox(height: 16), // Espaço vertical
            ElevatedButton(
              onPressed: loginUser, // Defina a função para o botão de login
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerRight,
                //minimumSize: const Size(68, 68),
                backgroundColor: const Color.fromRGBO(67, 54, 51, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                ),
              ),
              child: const Text(
                'Login', // Troque o ícone pelo texto "Login"
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


void loginUser() {
  // Lógica para fazer o login
  // ...
}
