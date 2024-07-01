import 'package:flutter/material.dart';
import 'package:task_track/src/views/Login/login_view.dart';

class RegistrationFooter extends StatelessWidget {
  final bool isKeyboardVisible;
  final Function registerUser;

  const RegistrationFooter({
    super.key, 
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
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(48, 48),
                      backgroundColor: Colors.black,
                      shape: const CircleBorder(),
                    ),
                    child: InkWell(
                      onTap: () => registerUser(),
                      child: const Icon(
                        size: 16,
                        Icons.arrow_forward,
                        color: Colors.white,
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