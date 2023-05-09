import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Color? borderColor;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        cursorColor: const Color(0xFF969696),
        cursorWidth: 1.2,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(
            color: Color(0xFFDA637B),
            fontSize: 19,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: Color(0xFFDA637B),
            ),
            gapPadding: 10,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: borderColor ?? const Color.fromARGB(255, 150, 150, 150),
            ),
            gapPadding: 10,
          ),
        ));
  }
}
