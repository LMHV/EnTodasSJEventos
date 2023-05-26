import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/utils/database_calls/login_user.dart';
import 'package:practicando_flutter/utils/show_snackbar.dart';
import 'package:practicando_flutter/widgets/custom_icon_button.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool wrongUser = false;
  bool _isDisabled = false;
  Map<String, dynamic> isLoged = {'error': false, 'msg': ''};

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: widget.contextHeight * 0.08),
              CustomTextFormField(
                labelText: "Email",
                validatorType: ValidatorTypes.email,
                requiredField: true,
                hintText: "ejemplo@gmail.com",
                controller: emailController,
              ),
              SizedBox(height: widget.contextHeight * 0.02),
              CustomTextFormField(
                labelText: "Contraseña",
                validatorType: ValidatorTypes.password,
                requiredField: true,
                hintText: "Contraseña7#",
                controller: passwordController,
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
                  height: isLoged['error'] == true
                      ? widget.contextHeight * 0.03
                      : widget.contextHeight * 0),
              CustomOutlinedButton(
                text: "Ingresar",
                textColor: const Color(0xFFFFFFFF),
                urlIcon: 'tick.png',
                isIcon: false,
                isDisabled: _isDisabled,
                width: 20,
                height: 20,
                callback: () async {
                  if (_formKey.currentState!.validate()) {
                    _isDisabled = true;
                    setState(() {});
                    isLoged = await loginUser(
                        emailController.text, passwordController.text);
                    isLoged['error'] == false
                        ? {
                            showSnackbar(
                                context, isLoged['message'], isLoged['error']),
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (route) => false)
                          }
                        : showSnackbar(
                            context, isLoged['message'], isLoged['error']);
                    _isDisabled = false;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: widget.contextHeight * 0.02),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    thickness: 1,
                    endIndent: widget.contextWidth * 0.48,
                    indent: widget.contextWidth * 0.02,
                  ),
                  const Text("o ingresá con"),
                  Divider(
                    thickness: 1,
                    indent: widget.contextWidth * 0.48,
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
              SizedBox(
                  height: isLoged['error'] == false
                      ? widget.contextHeight * 0
                      : widget.contextHeight * 0.01),
              Divider(
                thickness: 1,
                endIndent: widget.contextWidth * 0.02,
                indent: widget.contextWidth * 0.02,
              ),
              SizedBox(
                  height: isLoged['error'] == false
                      ? widget.contextHeight * 0
                      : widget.contextHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Todavia no tenes cuenta?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 120, 120, 120))),
                  CustomTextButton(
                    text: 'Registrate',
                    callback: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/signup', (route) => false);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
              CustomTextButton(
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
*/