import 'package:flutter/material.dart';
import 'package:task_track/src/views/login_view.dart';

class MyRegisterPage extends StatefulWidget {
  final String title;

  const MyRegisterPage({super.key, required this.title});

  @override
  _MyRegisterPage createState() => _MyRegisterPage();
}

class _MyRegisterPage extends State<MyRegisterPage> {
  String loginBox = "";
  final TextEditingController userController = TextEditingController();
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Stack(
                  children: <Widget>[
                    Positioned(
                      top: 164,
                      left: 25,
                      child: Text(
                        'Registre-se',
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
                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      hintText: "Digite seu nome",
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
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(222, 203, 183, 100)),
                    ),
                  ),
                  TextField(
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
                  const SizedBox(height: 16.0),
                  TextField(
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
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                      visible: !isKeyboardVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyLoginPage(
                                          title:
                                              'Teste')),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color.fromRGBO(67, 54, 51, 100),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 190), 
                            ElevatedButton(
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
