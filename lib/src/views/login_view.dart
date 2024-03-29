import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_track/src/views/register_view.dart';

class MyLoginPage extends StatefulWidget {
  final String title;

  const MyLoginPage({Key? key, required this.title}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String loginBox = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: const Stack(
                  children: <Widget>[
                    Positioned(
                      top: 164,
                      left: 25,
                      child: Text(
                        'Seja bem vindo',
                        style: TextStyle(
                          fontSize: 36,
                          color: Color.fromRGBO(67, 54, 51, 100),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Digite seu email",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(222, 203, 183, 100)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(211, 210, 210, 100)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(67, 54, 51, 100)),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(222, 203, 183, 100)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Digite sua senha",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(222, 203, 183, 100)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(211, 210, 210, 100)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(67, 54, 51, 100)),
                        ),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(222, 203, 183, 100)),
                      ),
                    ),
                  ),
                  const Align(
                    alignment:
                        Alignment.centerRight, // Alinha o widget à direita
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
              ),
            ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: const Text('MyButton'),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                      visible: !isKeyboardVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          // Alterado de Column para Row
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              // Adiciona o GestureDetector
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyRegisterPage(title: 'Teste')), // Navega para RegisterScreen
                                );
                              },
                              child: const Text(
                                'Registrar-se',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color.fromRGBO(67, 54, 51, 100),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 85), // Adiciona um espaço de 20 pixels
                            ElevatedButton(
                                // Botão movido aqui
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(68, 68),
                                  backgroundColor:
                                      Color.fromRGBO(67, 54, 51, 100),
                                  shape: CircleBorder(),
                                ),
                                child: const Icon(
                                  size: 24,
                                  Icons.arrow_forward,
                                  color: Color.fromRGBO(222, 203, 183, 100),
                                )),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
