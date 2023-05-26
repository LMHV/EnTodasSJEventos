import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String urlIcon;
  final VoidCallback? callback;
  final Color? backgroundButtonColor;
  final Color? iconColor;
  final bool? hasIconColor;
  final bool? hasBorder;
  final double? height;
  final double? width;
  final double? containerPadding;

  const CustomIconButton({
    super.key,
    required this.urlIcon,
    this.backgroundButtonColor,
    this.callback,
    this.iconColor,
    this.height,
    this.width,
    this.containerPadding,
    this.hasIconColor = true,
    this.hasBorder = false,
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
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border:
                hasBorder! ? Border.all(color: const Color(0xFF969696)) : null,
            color: backgroundButtonColor ?? Colors.white,
          ),
          child: Image.asset(
            'assets/icons/$urlIcon',
            color: hasIconColor!
                ? iconColor ?? const Color.fromARGB(255, 0, 0, 0)
                : null,
          )),
    );
  }
}
