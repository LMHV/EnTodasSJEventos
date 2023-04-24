import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        title: const Text("App Bar"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
            child: Expanded(
          child: Column(children: const [
            Text("Categorias",
                style: TextStyle(
                  color: Color(0xFF343333),
                  fontSize: 25,
                )),
            CustomCategory(
              categoryTitle: "Deportes",
              urlBackgroundImage: 'banner_sports.jpeg',
            ),
            CustomCategory(
              categoryTitle: "Gastronomia",
              urlBackgroundImage: 'banner_gastronomy.jpeg',
            ),
            CustomCategory(
              categoryTitle: "Educacional",
              urlBackgroundImage: 'banner_educational.jpeg',
            ),
            CustomCategory(
              categoryTitle: "Festival",
              urlBackgroundImage: 'banner_festival.jpeg',
            ),
            CustomCategory(
              categoryTitle: "Investigacion",
              urlBackgroundImage: 'banner_research.jpeg',
            ),
            CustomCategory(
              categoryTitle: "Teatro",
              urlBackgroundImage: 'banner_theatre.jpeg',
            ),
          ]),
        )),
      ),
    );
  }
}
