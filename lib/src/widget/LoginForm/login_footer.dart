import 'package:flutter/material.dart';
import 'package:task_track/src/views/Register/register_view.dart';

class LoginFooter extends StatelessWidget {
  final bool isKeyboardVisible;
  final VoidCallback loginUser;

  const LoginFooter({
    super.key,
    required this.isKeyboardVisible,
    required this.loginUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          builder: (context) => const MyRegisterPage(title: 'Teste'),
                        ),
                      );
                    },
                    child: const Text(
                      'Registrar-se',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(67, 54, 51, 100),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 85),
                ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerRight,
                    fixedSize: const Size(68, 68),
                    backgroundColor: const Color.fromRGBO(67, 54, 51, 100),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    size: 24,
                    Icons.arrow_forward,
                    color: Color.fromRGBO(222, 203, 183, 100),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
