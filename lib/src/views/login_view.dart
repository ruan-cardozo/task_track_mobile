import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_track/src/services/user_service.dart';
import 'package:task_track/src/views/home_view.dart';
import 'package:task_track/src/views/register_view.dart';
import 'package:task_track/src/widget/LoginForm/login_footer.dart';
import 'package:task_track/src/widget/LoginForm/login_form.dart';
import 'package:task_track/src/widget/LoginForm/login_header.dart';

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
  final userService = UserService(baseUrl: 'http://172.24.3.79:3000');

  void loginUser() async {
    var response =
        await userService.login(emailController.text, passwordController.text);

    if ([200, 201].contains(response.statusCode)) {
      Fluttertoast.showToast(
          msg: "Usuário logado com sucesso.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Falha ao logar usuário.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            LoginHeader(),
            LoginForm(
                emailController: emailController,
                passwordController: passwordController
                ),
            LoginFooter(
                isKeyboardVisible: isKeyboardVisible, loginUser: loginUser)
          ],
        ),
      ),
    );
  }
}
