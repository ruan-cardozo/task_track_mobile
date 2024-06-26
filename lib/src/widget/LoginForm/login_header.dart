import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: const Stack(
          children: <Widget>[
            Positioned.fill(
              child: Center(
                child: Text(
                  'Seja bem-vindo',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(67, 54, 51, 100),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
