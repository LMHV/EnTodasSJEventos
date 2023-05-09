import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/login_screen/login_screen.dart';
import 'package:practicando_flutter/screens/signup_screen/widgets/register_form.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                RegisterForm(
                    contextHeight: contextHeight, contextWidth: contextWidth)
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
