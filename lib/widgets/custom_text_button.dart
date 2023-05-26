import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? callback;
  final String text;
  final Color? textColor;
  final bool isDisabled;

  const CustomTextButton({
    super.key,
    required this.text,
    this.textColor,
    this.callback,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisabled ? null : callback,
      child: Text(text,
          style: TextStyle(color: textColor ?? const Color(0xFFDA637B))),
    );
  }
}
