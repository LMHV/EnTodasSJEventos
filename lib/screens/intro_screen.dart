import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;
    final contextHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: contextWidth,
        height: contextHeight,
        decoration: const BoxDecoration(color: Color(0xFFC95F6F)),
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                './assets/icons/appicon.png',
                width: contextWidth * 0.3,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            CustomOutlinedButton(
              text: "Ingresar a mi cuenta",
              isIcon: false,
              backgroundColor: const Color(0xFFFFFFFF),
              textColor: const Color(0xFFC95F6F),
              callback: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              },
            ),
            CustomOutlinedButton(
              text: "Registrarme",
              isIcon: false,
              backgroundColor: const Color(0xFFFFFFFF),
              textColor: const Color.fromARGB(255, 0, 0, 0),
              callback: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/signup', (route) => false);
              },
            )
          ]),
        ),
      ),
    );
  }
}
