import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: const Color(0xFF171F41),
      /*appBar: AppBar(
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(200),
        title: const Text(
          "EnTodas SJ",
          style: TextStyle(color: Color.fromARGB(255, 209, 110, 110)),
        ),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF171F41),
              ),
              height: 180,
              width: contextWidth,
              child: Column(
                children: const [
                  Text(
                    'Registrate',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Descripcion")
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
