import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String? label;
  final String? hint;
  final Color? customColor;

  const CustomTextField({
    super.key,
    required this.width,
    this.label,
    this.hint,
    required this.controller,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintText: hint,
            label: Text(label ?? ''),
            filled: true,
            fillColor: customColor ?? const Color.fromARGB(255, 238, 238, 238),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        autofocus: true,
      ),
    ));
  }
}
