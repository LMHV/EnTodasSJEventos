import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:practicando_flutter/widgets/custom_stepper.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(200),
        title: const Text(
          "EnTodas San Juan",
          style: TextStyle(color: Color(0xFF989898)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 73, 73, 73),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const CustomStepper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
