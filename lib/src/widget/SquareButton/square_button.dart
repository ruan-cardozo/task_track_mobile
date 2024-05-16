import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final Color color;
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final IconData icon;
  final Color titleColor;
  final TextStyle? titleStyle;

  const SquareButton({
    Key? key,
    required this.color,
    required this.title,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.icon,
    this.titleColor = Colors.white,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: titleStyle ??
                  TextStyle(
                      color: titleColor,
                      fontSize:
                          16), 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
