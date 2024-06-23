import 'package:flutter/cupertino.dart';

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
    );
  }
}