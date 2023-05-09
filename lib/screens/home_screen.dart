import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/database_calls/get_categories.dart';
import 'package:practicando_flutter/widgets/custom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_bottom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_category.dart';
//import 'package:practicando_flutter/screens/signup_screen.dart';
//import 'package:practicando_flutter/widgets/custom_button.dart';
//import 'package:practicando_flutter/widgets/custom_stepper.dart';
//import '../widgets/custom_image_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final Document? categories;

  @override
  void initState() {
    super.initState();
    //categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
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
          const CustomCategory(
            categoryTitle: "Otros",
            urlBackgroundImage: 'background1.jpeg',
          ),
        ])),
      ),
    );
  }
}
