import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/signup_screen.dart';
import 'package:practicando_flutter/widgets/custom_text_button.dart';
import 'package:practicando_flutter/widgets/custom_textformfield.dart';
import '../widgets/custom_image_button.dart';
import '../widgets/custom_outlined_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height;
    final double contextWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      Image.asset('assets/images/background2.jpeg'),
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(136, 182, 110, 110),
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
                              return const HomeScreen();
                            }), (route) => false);
                          },
                        ),
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Logeate',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Ingresá a tu cuenta EnTodas SJ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
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
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        SizedBox(height: contextHeight * 0.08),
                        const CustomTextFormField(labelText: "Email"),
                        SizedBox(height: contextHeight * 0.02),
                        const CustomTextFormField(labelText: "Contraseña"),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextButton(
                              text: "He olvidado mi contraseña"),
                        ),
                        SizedBox(height: contextHeight * 0.03),
                        CustomOutlinedButton(
                          text: "Confirmar",
                          textColor: const Color(0xFFFFFFFF),
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
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(
                              thickness: 1,
                              endIndent: contextWidth * 0.4,
                              indent: contextWidth * 0.02,
                            ),
                            const Text("or"),
                            Divider(
                              thickness: 1,
                              indent: contextWidth * 0.4,
                              endIndent: contextWidth * 0.02,
                            ),
                          ],
                        ),
                        CustomOutlinedButton(
                          text: "Ingresar con Google",
                          urlIcon: 'google.png',
                          isIcon: true,
                          width: 20,
                          height: 20,
                          backgroundColor: Colors.white,
                          callback: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }), (route) => false);
                          },
                        ),
                        CustomOutlinedButton(
                          text: "Ingresar con Facebook",
                          urlIcon: 'facebook.png',
                          isIcon: true,
                          width: 20,
                          height: 20,
                          backgroundColor: Colors.white,
                          callback: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }), (route) => false);
                          },
                        ),
                        SizedBox(height: contextHeight * 0.01),
                        Divider(
                          thickness: 1,
                          endIndent: contextWidth * 0.02,
                          indent: contextWidth * 0.02,
                        ),
                        SizedBox(height: contextHeight * 0.01),
                        CustomOutlinedButton(
                          text: "Crea tu cuenta",
                          urlIcon: 'edit.png',
                          isIcon: true,
                          width: 20,
                          height: 20,
                          backgroundColor: Colors.white,
                          callback: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return const SignupScreen();
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
