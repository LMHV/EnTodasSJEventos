import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String variable;
  const CategoryScreen({
    super.key,
    required this.variable,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.abc_sharp),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          },
        ),
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white.withAlpha(200),
        title: const Text(
          "EnTodas San Juan",
          style: TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
        ),
      ),
      body: Text(variable),
    );
  }
}
