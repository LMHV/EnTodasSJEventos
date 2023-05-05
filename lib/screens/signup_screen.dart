import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/screens/login_screen.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';
import 'package:practicando_flutter/widgets/custom_textformfield.dart';

//import 'package:practicando_flutter/widgets/custom_stepper.dart';
//import 'package:practicando_flutter/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageButton(
                          urlImage: 'back.png',
                          backgroundButtonColor: const Color(0x00FFFFFF),
                          iconColor: const Color(0xFFFFFFFF),
                          callback: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }), (route) => false);
                          },
                        ),
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Registrate',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Crea tu cuenta EnTodas SJ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 57, 57, 57),
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(240, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        SizedBox(height: contextHeight * 0.04),
                        const Text("Ingresá tus datos...",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFDA637B))),
                        SizedBox(height: contextHeight * 0.06),
                        const CustomTextFormField(labelText: "Nombre"),
                        SizedBox(height: contextHeight * 0.02),
                        const CustomTextFormField(labelText: "Apellido"),
                        SizedBox(height: contextHeight * 0.02),
                        const CustomTextFormField(labelText: "Email"),
                        SizedBox(height: contextHeight * 0.02),
                        const CustomTextFormField(labelText: "Contraseña"),
                        SizedBox(height: contextHeight * 0.08),
                        CustomOutlinedButton(
                          text: "Crear cuenta",
                          textColor: const Color.fromARGB(255, 255, 255, 255),
                          urlIcon: 'tick.png',
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
