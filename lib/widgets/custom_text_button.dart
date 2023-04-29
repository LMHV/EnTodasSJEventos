import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;

  const CustomTextButton({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text,
          style: TextStyle(color: textColor ?? const Color(0xFFDA637B))),
    );
  }
}
