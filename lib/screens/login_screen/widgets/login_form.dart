import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/utils/database_calls/login_user.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';
import 'package:practicando_flutter/widgets/custom_text_button.dart';
import 'package:practicando_flutter/widgets/custom_textformfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.contextHeight,
    required this.contextWidth,
  });

  final double contextHeight;
  final double contextWidth;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool wrongUser = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            SizedBox(height: widget.contextHeight * 0.08),
            CustomTextFormField(
              labelText: "Email",
              controller: emailController,
              borderColor: wrongUser ? const Color(0xFFE92E2E) : null,
            ),
            SizedBox(height: widget.contextHeight * 0.02),
            CustomTextFormField(
              labelText: "Contraseña",
              controller: passwordController,
              borderColor: wrongUser ? const Color(0xFFE92E2E) : null,
            ),
            if (wrongUser)
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Usuario incorrecto",
                  style: TextStyle(color: Color.fromARGB(255, 233, 46, 46)),
                ),
              ),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomTextButton(text: "He olvidado mi contraseña"),
            ),
            SizedBox(
                height: wrongUser
                    ? widget.contextHeight * 0.0
                    : widget.contextHeight * 0.03),
            CustomOutlinedButton(
              text: "Ingresar",
              textColor: const Color(0xFFFFFFFF),
              urlIcon: 'tick.png',
              isIcon: false,
              width: 20,
              height: 20,
              callback: () async {
                final bool isWrong = await loginUser(
                    emailController.text, passwordController.text);
                isWrong
                    ? Navigator.of(context)
                        .pushNamedAndRemoveUntil('/home', (route) => false)
                    : wrongUser = true;
                setState(() {});
              },
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  thickness: 1,
                  endIndent: widget.contextWidth * 0.4,
                  indent: widget.contextWidth * 0.02,
                ),
                const Text("or"),
                Divider(
                  thickness: 1,
                  indent: widget.contextWidth * 0.4,
                  endIndent: widget.contextWidth * 0.02,
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (route) => false);
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (route) => false);
              },
            ),
            SizedBox(height: widget.contextHeight * 0.01),
            Divider(
              thickness: 1,
              endIndent: widget.contextWidth * 0.02,
              indent: widget.contextWidth * 0.02,
            ),
            SizedBox(height: widget.contextHeight * 0.01),
            CustomOutlinedButton(
              text: "Crea tu cuenta",
              urlIcon: 'edit.png',
              isIcon: true,
              width: 20,
              height: 20,
              backgroundColor: Colors.white,
              callback: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/signup', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
