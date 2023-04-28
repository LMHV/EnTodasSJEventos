import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  //final double height;
  //final double width;
  //final bool isText;
  //final String text;
  //final String? urlImage;

  const CustomButton({
    super.key,
    //required this.width,
    //required this.height,
    //required this.isText,
    //this.urlImage,
    //required this.text,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: _isElevated
                ? [
                    BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                : null),
      ),
    );
  }
}
