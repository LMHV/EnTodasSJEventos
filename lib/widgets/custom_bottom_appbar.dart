import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Color(0xFFDA637B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomImageButton(
            urlImage: 'user.png',
            width: 43,
            height: 43,
            backgroundButtonColor: Color(0x00000000),
            iconColor: Color(0xffffffff),
          ),
          CustomImageButton(
            urlImage: 'home2.png',
            width: 35,
            height: 35,
            backgroundButtonColor: const Color(0x00000000),
            iconColor: const Color(0xffffffff),
            callback: () {
              if (ModalRoute.of(context)?.settings.name != "/") {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }), (route) => false);
              }
            },
          ),
          const CustomImageButton(
            urlImage: 'menu.png',
            width: 32,
            height: 32,
            backgroundButtonColor: Color(0x00000000),
            iconColor: Color(0xffffffff),
          ),
        ],
      ),
    );
  }
}
