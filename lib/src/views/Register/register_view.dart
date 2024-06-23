import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_track/src/config/api_config.dart';
import 'package:task_track/src/services/auth_service.dart';import 'package:task_track/src/widget/RegistrationForm/registration_form.dart';
import 'package:task_track/src/widget/RegistrationForm/registration_footer.dart';
import 'package:task_track/src/widget/RegistrationForm/registration_header.dart';

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
  final userService = UserService(baseUrl: BASE_URL);

  void registerUser() async {
    var response = await userService.register(
        userController.text, emailController.text, passwordController.text);

    if ([200, 201].contains(response.statusCode)) {
      Fluttertoast.showToast(
          msg: "Usuário cadastrado com sucesso.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
        msg: "Houve um erro ao cadastrar o usuário.",
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
            const RegistrationHeader(),
            const SizedBox(height: 100),
            RegistrationForm(
              userController: userController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            RegistrationFooter(
              isKeyboardVisible: isKeyboardVisible,
              registerUser: registerUser,
            ),
          ],
        ),
      ),
    );
  }
}
