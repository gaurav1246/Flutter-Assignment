import 'package:fibonacci/utils/colorUtils.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String content;
  final Color buttonColor;
  final Color textColor;
  const CommonButton(
      {super.key,
      required this.onPressed,
      required this.buttonColor,
      required this.content,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        color: buttonColor,
        child: Center(
            child: Text(
          content,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
