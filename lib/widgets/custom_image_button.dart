import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String urlImage;
  final VoidCallback? callback;

  const CustomImageButton({
    super.key,
    required this.urlImage,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
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
