import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const CustomTextField({
    super.key, 
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.obscureText = false, 
    bool? enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(222, 203, 183, 100)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(211, 210, 210, 100)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(67, 54, 51, 100)),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Color.fromRGBO(222, 203, 183, 100)),
      ),
    );
  }
}
