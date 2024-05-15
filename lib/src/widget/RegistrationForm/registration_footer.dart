import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_track/src/views/Login/login_view.dart';

class RegistrationFooter extends StatelessWidget {
  final bool isKeyboardVisible;
  final Function registerUser;

  RegistrationFooter({
    required this.isKeyboardVisible,
    required this.registerUser,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyLoginPage(title: 'Teste'),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromRGBO(67, 54, 51, 100),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 190),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(68, 68),
                      backgroundColor: Color.fromRGBO(67, 54, 51, 100),
                      shape: const CircleBorder(),
                    ),
                    child: InkWell(
                      onTap: () => registerUser(),
                      child: const Icon(
                        size: 24,
                        Icons.arrow_forward,
                        color: Color.fromRGBO(222, 203, 183, 100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}