import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, bool color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: color ? const Color(0xFFFF4949) : const Color(0xFF3C7638),
        )),
    duration: const Duration(seconds: 5),
    elevation: 5,
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.down,
    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
    closeIconColor: const Color(0xFF353535),
    backgroundColor: const Color(0xFFD1D1D1),
  ));
}
