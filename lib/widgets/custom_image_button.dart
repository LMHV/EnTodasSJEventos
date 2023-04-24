import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String urlImage;
  //void Function function;

  const CustomImageButton({
    super.key,
    required this.urlImage,
    //required this.function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
          padding: const EdgeInsets.all(7),
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xC8FFFFFF),
          ),
          child: Image.asset(
            'assets/icons/$urlImage',
          )),
    );
  }
}
