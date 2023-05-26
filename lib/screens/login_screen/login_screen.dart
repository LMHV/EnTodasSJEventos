import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/login_screen/widgets/login_form.dart';
import '../../widgets/custom_icon_button.dart';
import '../home_screen.dart';

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
        backgroundColor: const Color.fromARGB(136, 182, 110, 110),
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
                        CustomIconButton(
                          urlIcon: 'back.png',
                          backgroundButtonColor: const Color(0x00FFFFFF),
                          iconColor: const Color(0xFFFFFFFF),
                          callback: () {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
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
                LoginForm(
                    contextHeight: contextHeight, contextWidth: contextWidth),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
