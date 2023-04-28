import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? callback;
  final String text;
  final String? urlIcon;
  final bool isIcon;
  final double? width;
  final double? height;

  const CustomOutlinedButton(
      {super.key,
      this.callback,
      required this.text,
      this.urlIcon,
      required this.isIcon,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: callback,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isIcon
                ? Image.asset(
                    urlIcon != null ? '$urlIcon' : 'assets/icons/warning.png',
                    width: width ?? 20,
                    height: height ?? 20,
                  )
                : const SizedBox(height: 0),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xFFDA637B), fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
