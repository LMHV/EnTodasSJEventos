import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/validate/validate_email.dart';
import 'package:practicando_flutter/utils/validate/validate_name.dart';
import 'package:practicando_flutter/utils/validate/validate_password.dart';

enum ValidatorTypes {
  name,
  email,
  password,
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final Color? borderColor;
  final ValidatorTypes validatorType;
  final bool? requiredField;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.borderColor,
      this.hintText,
      required this.validatorType,
      this.requiredField = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: validatorType == ValidatorTypes.password ? true : false,
        validator: (value) =>
            _validateValue(validatorType, value, requiredField),
        cursorColor: const Color(0xFF969696),
        cursorWidth: 1.2,
        decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 200, 200, 200),
            ),
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
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              gapPadding: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: borderColor ?? const Color.fromARGB(255, 150, 150, 150),
              ),
              gapPadding: 10,
            )));
  }
}

_validateValue(validatorType, value, requiredField) {
  if (value.isEmpty && requiredField) {
    return 'Campo obligatorio';
  }
  if (validatorType == ValidatorTypes.email) {
    return isEmailValid(value) ? null : 'Formato de email incorrecto';
  }
  if (validatorType == ValidatorTypes.password) {
    return isPasswordValid(value) ? null : 'Formato de contraseña incorrecto';
  }
  if (validatorType == ValidatorTypes.name) {
    return isNameValid(value) ? null : 'Formato de nombre incorrecto';
  }
  return null;
}
