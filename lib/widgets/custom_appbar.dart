import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/signup_screen.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: ClipRect(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 50),
        child: Container(
          color: Colors.transparent,
        ),
      )),
      elevation: 2,
      centerTitle: true,
      backgroundColor: Colors.white.withAlpha(200),
      title: const Text(
        "EnTodas SJ",
        style: TextStyle(color: Color(0xFFDA637B)),
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: CustomImageButton(
          urlImage: 'back.png',
          backgroundButtonColor: const Color(0x00FFFFFF),
          iconColor: const Color(0xFFDA637B),
          callback: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return const SignupScreen();
            }), (route) => false);
          },
        ),
      ),
      leadingWidth: 45,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        50,
      );
}
