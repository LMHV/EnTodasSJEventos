import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? callback;
  final String text;
  final String? urlIcon;
  final bool isIcon;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomOutlinedButton({
    super.key,
    this.callback,
    required this.text,
    this.urlIcon,
    required this.isIcon,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 5),
        backgroundColor: backgroundColor ?? const Color(0xFFDA637B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon
              ? Image.asset(
                  urlIcon != null
                      ? 'assets/icons/$urlIcon'
                      : 'assets/icons/warning.png',
                  width: width ?? 20,
                  height: height ?? 20,
                )
              : const SizedBox(height: 0),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
                color: textColor ?? const Color.fromARGB(255, 20, 20, 20),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
