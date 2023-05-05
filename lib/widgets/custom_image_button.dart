import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String urlImage;
  final VoidCallback? callback;
  final Color? backgroundButtonColor;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? containerPadding;

  const CustomImageButton({
    super.key,
    required this.urlImage,
    this.backgroundButtonColor,
    this.callback,
    this.iconColor,
    this.height,
    this.width,
    this.containerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          padding: EdgeInsets.all(containerPadding ?? 7),
          width: width ?? 35,
          height: height ?? 35,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: backgroundButtonColor ?? Colors.white,
          ),
          child: Image.asset(
            'assets/icons/$urlImage',
            color: iconColor ?? const Color.fromARGB(255, 0, 0, 0),
          )),
    );
  }
}
