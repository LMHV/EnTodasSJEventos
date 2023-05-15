import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Color(0xFFDA637B),
      color: Color(0xFF969696),
      strokeWidth: 1.5,
    );
  }
}
