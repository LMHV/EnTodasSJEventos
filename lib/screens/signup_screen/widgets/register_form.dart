import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/database_calls/create_user.dart';
import 'package:practicando_flutter/widgets/custom_outlined_button.dart';
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
  bool _alreadyExists = false;

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
            SizedBox(height: widget.contextHeight * 0.06),
            CustomTextFormField(
                labelText: "Nombre", controller: nameController),
            SizedBox(height: widget.contextHeight * 0.02),
            CustomTextFormField(
                labelText: "Apellido", controller: surnameController),
            SizedBox(height: widget.contextHeight * 0.02),
            CustomTextFormField(
              labelText: "Email",
              controller: emailController,
              borderColor: _alreadyExists
                  ? const Color.fromARGB(255, 223, 46, 46)
                  : null,
            ),
            SizedBox(height: widget.contextHeight * 0.02),
            CustomTextFormField(
                labelText: "Contraseña", controller: passwordController),
            if (_alreadyExists)
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Usuario ya existente',
                    style: TextStyle(
                      color: Color.fromARGB(255, 233, 46, 46),
                    )),
              ),
            SizedBox(height: widget.contextHeight * 0.05),
            CustomOutlinedButton(
              text: "Crear cuenta",
              textColor: const Color.fromARGB(255, 255, 255, 255),
              urlIcon: 'tick.png',
              isIcon: false,
              width: 20,
              height: 20,
              callback: () async {
                final bool isCreated = await createUser(
                    nameController.text,
                    surnameController.text,
                    emailController.text,
                    passwordController.text);
                isCreated
                    ? Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false)
                    : _alreadyExists = true;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
