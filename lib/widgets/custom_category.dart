import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';

class CustomCategory extends StatelessWidget {
  final String categoryTitle;
  final String urlBackgroundImage;

  const CustomCategory(
      {super.key,
      required this.categoryTitle,
      required this.urlBackgroundImage});

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    //double contextHeight = MediaQuery.of(context).size.height;

    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 100,
        width: contextWidth * 0.75,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            color: Color(0xFF262626),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0, 1),
              )
            ]),
        child: Stack(children: [
          Image.asset(
            'assets/images/$urlBackgroundImage',
            fit: BoxFit.cover,
            height: 100,
            width: contextWidth * 0.75,
          ),
          //Widget Imagen,
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      decoration: const BoxDecoration(
                        color: Color(0xC8FFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(categoryTitle,
                          style: const TextStyle(
                            color: Color(0xFF343333),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                    const CustomImageButton(urlImage: 'right_arrow_chevron.png')
                  ]))
        ]));
  }
}
