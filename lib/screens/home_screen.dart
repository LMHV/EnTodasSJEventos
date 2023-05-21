import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/database_calls/get_categories.dart';
import 'package:practicando_flutter/widgets/custom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_bottom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_category.dart';
import 'package:practicando_flutter/infrastructure/models/category_model.dart';
import 'package:practicando_flutter/widgets/custom_circular_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
            child: FutureBuilder(
          future: getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomCircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 50, bottom: 20),
                  child: const Text("CATEGORIAS",
                      style: TextStyle(
                        color: Color(0xFF343333),
                        fontSize: 20,
                      )),
                ),
                for (Category category in snapshot.data.categories) ...[
                  CustomCategory(
                    categoryTitle: category.name,
                    urlBackgroundImage: category.urlImage,
                  )
                ]
              ]);
            } else {
              return const Text('No data');
            }
          },
        )),
      ),
    );
  }
}
