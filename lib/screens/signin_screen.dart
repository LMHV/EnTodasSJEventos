import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';
import 'package:practicando_flutter/widgets/custom_text_button.dart';

//import 'package:practicando_flutter/widgets/custom_stepper.dart';
//import 'package:practicando_flutter/widgets/custom_textfield.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController surnameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height;
    final double contextWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      Image.asset('assets/images/background1.jpeg'),
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(137, 191, 132, 132),
        body: SingleChildScrollView(
          child: SizedBox(
            height: contextHeight,
            child: Column(
              children: [
                Stack(children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Container(
                    height: 180,
                    width: contextWidth,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Registrate',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFFDA637B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Crea tu cuenta EnTodas SJ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ]),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(height: contextHeight * 0.08),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nombre",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nombre incorrecto";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: contextHeight * 0.02),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Apellido",
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.02),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                        SizedBox(height: contextHeight * 0.02),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Contraseña",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextButton(
                                text: "Confirmar",
                                urlIcon: 'assets/icons/tick.png',
                                isIcon: false,
                                width: 20,
                                height: 20,
                                callback: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) {
                                    return const HomeScreen();
                                  }), (route) => false);
                                },
                              ),
                              const CustomOutlinedButton(
                                text: "Volver",
                                isIcon: false,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
