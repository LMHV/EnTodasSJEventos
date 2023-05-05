import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;

  const CustomTextFormField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          border: const OutlineInputBorder(
              gapPadding: 10,
              borderRadius: BorderRadius.all(Radius.circular(50)))),
    );
  }
}
