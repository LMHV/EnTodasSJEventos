import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/database_calls/create_user.dart';
import 'package:practicando_flutter/utils/show_snackbar.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';
import 'package:practicando_flutter/widgets/custom_text_button.dart';
import 'package:practicando_flutter/widgets/custom_textformfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm(
      {super.key, required this.contextHeight, required this.contextWidth});
  final double contextHeight;
  final double contextWidth;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isDisabled = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        decoration: const BoxDecoration(
            color: Color.fromARGB(240, 255, 255, 255),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            SizedBox(height: widget.contextHeight * 0.04),
            const Text("Ingresá tus datos...",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFDA637B))),
            SizedBox(height: widget.contextHeight * 0.04),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "Nombre",
                    validatorType: ValidatorTypes.name,
                    requiredField: true,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: widget.contextHeight * 0.02,
                  ),
                  CustomTextFormField(
                    labelText: "Apellido",
                    validatorType: ValidatorTypes.name,
                    requiredField: true,
                    controller: surnameController,
                  ),
                  SizedBox(height: widget.contextHeight * 0.02),
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
                  SizedBox(height: widget.contextHeight * 0.03),
                  CustomOutlinedButton(
                      text: "Crear cuenta",
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      urlIcon: 'tick.png',
                      isIcon: false,
                      isDisabled: _isDisabled,
                      width: 20,
                      height: 20,
                      callback: () async {
                        if (_formKey.currentState!.validate()) {
                          _isDisabled = true;
                          setState(() {});
                          final Map<String, dynamic> isCreated =
                              await createUser(
                                  nameController.text,
                                  surnameController.text,
                                  emailController.text,
                                  passwordController.text);
                          isCreated['error'] == false
                              ? {
                                  showSnackbar(context, isCreated['message'],
                                      isCreated['error']),
                                  await Future.delayed(
                                      const Duration(seconds: 2)),
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/login', (route) => false)
                                }
                              : showSnackbar(context, isCreated['message'],
                                  isCreated['error']);
                          _isDisabled = false;
                          setState(() {});
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ya tenes una cuenta?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 120, 120, 120))),
                      CustomTextButton(
                        text: 'Logeate',
                        callback: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (route) => false);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
