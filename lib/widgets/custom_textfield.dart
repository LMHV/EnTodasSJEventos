import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String? label;
  final String? hint;
  final Icon? iconType;

  const CustomTextField({
    super.key,
    required this.width,
    this.label,
    this.hint,
    required this.controller,
    this.iconType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: width,
      child: TextField(
        cursorColor: const Color(0xFF969696),
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: iconType,
            prefixIconColor: const Color(0xFF969696),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintText: hint,
            label: Text(label ?? ''),
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)))),
        autofocus: true,
      ),
    ));
  }
}
