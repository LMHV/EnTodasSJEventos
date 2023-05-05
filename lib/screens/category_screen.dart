import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_bottom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_event_card.dart';
import 'package:practicando_flutter/widgets/custom_image_button.dart';
import 'package:practicando_flutter/widgets/custom_textfield.dart';

import 'home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height;
    final double contextWidth = MediaQuery.of(context).size.width;
    final TextEditingController searchController = TextEditingController();

    return Stack(children: [
      Image.asset('assets/images/background2.jpeg'),
      Scaffold(
        backgroundColor: const Color(0xC6B56373),
        body: SizedBox(
          height: contextHeight,
          child: Column(
            children: [
              Stack(children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  height: 150,
                  width: contextWidth,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageButton(
                        urlImage: 'back.png',
                        backgroundButtonColor: const Color(0x00FFFFFF),
                        iconColor: const Color(0xFFFFFFFF),
                        callback: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }), (route) => false);
                        },
                      ),
                      Column(
                        children: const [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Deportes',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Todos los eventos de deportes en SJ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      CustomTextField(
                        width: 310,
                        controller: searchController,
                        label: 'Buscar...',
                        iconType: const Icon(Icons.search_rounded),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "San Martin / Sportivo",
                                ticketPrice: 600,
                                intEventState: 1,
                                typeSport: 'Futbol',
                                eventPlace: 'Estadio Bicentenario',
                              ),
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "Argentina / Brasil",
                                ticketPrice: 250,
                                intEventState: 2,
                                typeSport: 'Hockey',
                                eventPlace: 'Estadio Aldo Cantoni',
                              ),
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "Boca / River",
                                ticketPrice: 200,
                                intEventState: 3,
                                typeSport: 'Basketball',
                                eventPlace: 'Club Banco Hispano',
                              ),
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "Boca / River",
                                ticketPrice: 200,
                                intEventState: 3,
                                typeSport: 'Basketball',
                                eventPlace: 'Club Banco Hispano',
                              ),
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "Boca / River",
                                ticketPrice: 200,
                                intEventState: 3,
                                typeSport: 'Basketball',
                                eventPlace: 'Club Banco Hispano',
                              ),
                              CustomEventCard(
                                cardHeight: contextHeight * 0.11,
                                cardWidth: contextWidth,
                                title: "Boca / River",
                                ticketPrice: 200,
                                intEventState: 3,
                                typeSport: 'Basketball',
                                eventPlace: 'Club Banco Hispano',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        width: contextWidth,
        bottom: 0,
        child: const CustomBottomAppBar(),
      ),
    ]);
  }
}
