import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_button.dart';
import 'package:practicando_flutter/widgets/custom_category.dart';
import 'package:practicando_flutter/widgets/custom_stepper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          style: TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
            child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 50, bottom: 20),
            child: const Text("CATEGORIAS",
                style: TextStyle(
                  color: Color(0xFF343333),
                  fontSize: 20,
                )),
          ),
          const CustomCategory(
            categoryTitle: "Deportes",
            urlBackgroundImage: 'banner_sports.jpeg',
          ),
          const CustomCategory(
            categoryTitle: "Gastronomía",
            urlBackgroundImage: 'banner_gastronomy.jpeg',
          ),
          const CustomCategory(
            categoryTitle: "Educacional",
            urlBackgroundImage: 'banner_educational.jpeg',
          ),
          const CustomCategory(
            categoryTitle: "Festival",
            urlBackgroundImage: 'banner_festival.jpeg',
          ),
          const CustomCategory(
            categoryTitle: "Investigación",
            urlBackgroundImage: 'banner_research.jpeg',
          ),
          const CustomCategory(
            categoryTitle: "Teatro",
            urlBackgroundImage: 'banner_theatre.jpeg',
          ),
        ])),
      ),
    );
  }
}
