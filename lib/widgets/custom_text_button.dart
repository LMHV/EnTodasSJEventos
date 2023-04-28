import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? callback;
  final String text;
  final String? urlIcon;
  final bool isIcon;
  final double width;
  final double height;

  const CustomTextButton(
      {super.key,
      this.callback,
      required this.text,
      this.urlIcon,
      required this.isIcon,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        backgroundColor: const Color(0xFFDA637B),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isIcon
              ? Image.asset(
                  urlIcon != null ? '$urlIcon' : 'assets/icons/warning.png',
                  width: width,
                  height: height,
                )
              : const SizedBox(height: 0),
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 20, 20, 20),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
