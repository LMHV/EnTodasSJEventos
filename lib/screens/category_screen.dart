import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/utils/database_calls/get_events.dart';
import 'package:practicando_flutter/infrastructure/models/event_model.dart';
import 'package:practicando_flutter/widgets/custom_bottom_appbar.dart';
import 'package:practicando_flutter/widgets/custom_circular_progress_indicator.dart';
import 'package:practicando_flutter/widgets/custom_event_card.dart';
import 'package:practicando_flutter/widgets/custom_icon_button.dart';
import 'package:practicando_flutter/widgets/custom_textfield.dart';

import 'home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryTitle =
        ModalRoute.of(context)?.settings.arguments as String;
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
                      CustomIconButton(
                        urlIcon: 'back.png',
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
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              categoryTitle,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Todos los eventos de $categoryTitle en SJ",
                              style: const TextStyle(
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
                          child: FutureBuilder(
                            future: getEvents(categoryTitle),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CustomCircularProgressIndicator());
                              } else if (snapshot.hasData) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 40),
                                  child: Column(
                                    children: [
                                      for (Event event
                                          in snapshot.data.events) ...[
                                        CustomEventCard(
                                          title: event.title,
                                          eventState: event.eventState,
                                          type: event.type,
                                          eventPlace: event.eventPlace,
                                          ticketPrice: event.ticketPrice,
                                          category: event.category,
                                        )
                                      ]
                                    ],
                                  ),
                                );
                              } else {
                                return const Text('No event data');
                              }
                            },
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
