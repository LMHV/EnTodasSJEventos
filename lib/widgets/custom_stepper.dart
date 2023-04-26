import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: [
        Step(
            title: const Text('Nombre'),
            content: CustomTextField(
              width: 325,
              controller: nameController,
              label: 'Ingresar nombre',
            )),
        Step(
            title: const Text('Apellido'),
            content: CustomTextField(
              width: 325,
              controller: surnameController,
              label: 'Ingresar apellido',
            )),
        Step(
            title: const Text('Email'),
            content: CustomTextField(
              width: 325,
              controller: emailController,
              label: 'Ingresar email',
            )),
        Step(
            title: const Text('Contraseña'),
            content: CustomTextField(
              width: 325,
              controller: passwordController,
              label: 'Ingresar contraseña',
            )),
      ],
      onStepTapped: (int newIndex) {
        setState(() {
          _currentStep = newIndex;
        });
      },
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep != 3) {
          setState(() {
            _currentStep++;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep != 0) {
          setState(() {
            _currentStep--;
          });
        }
      },
    );
  }
}