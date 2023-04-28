import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final String? label;
  final String? hint;

  const CustomTextField({
    super.key,
    required this.width,
    this.label,
    this.hint,
    required this.controller,
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
            filled: false,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        autofocus: true,
      ),
    ));
  }
}
