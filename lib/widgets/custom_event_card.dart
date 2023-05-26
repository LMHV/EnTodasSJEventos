import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:practicando_flutter/widgets/custom_icon_button.dart';

class CustomEventCard extends StatefulWidget {
  final String title;
  final Array? dates;
  final Array? datetimes;
  final double? ticketPrice;
  final int eventState;
  final String type;
  final String eventPlace;
  final String category;

  const CustomEventCard({
    super.key,
    required this.title,
    this.dates,
    this.ticketPrice,
    required this.eventState,
    required this.type,
    required this.eventPlace,
    this.datetimes,
    required this.category,
  });

  @override
  State<CustomEventCard> createState() => _CustomEventCardState();
}

class _CustomEventCardState extends State<CustomEventCard> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height * 0.11;
    final double cardWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        _isActive = !_isActive;
        setState(() {});
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        height: _isActive ? cardHeight * 3 : cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: const Color(0xFFFFFFFF),
            boxShadow: _isActive
                ? [
                    const BoxShadow(
                      color: Color(0xFFC95F6F),
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ]
                : [
                    const BoxShadow(
                      color: Color(0xFFCBCBCB),
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ]),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    //NO PUEDO HACER FUNCIONAR EL OVERFLOW
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _isActive
                      ? const CustomIconButton(
                          urlIcon: 'top_arrow.png',
                          height: 12,
                          width: 12,
                          backgroundButtonColor: Color(0x00FFFFFF),
                          iconColor: Color.fromARGB(255, 0, 0, 0),
                          containerPadding: 0,
                        )
                      : const CustomIconButton(
                          urlIcon: 'down_arrow.png',
                          height: 12,
                          width: 12,
                          backgroundButtonColor: Color(0x00FFFFFF),
                          iconColor: Color.fromARGB(255, 0, 0, 0),
                          containerPadding: 0,
                        )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                        urlIcon: 'dot.png',
                        height: 12,
                        width: 12,
                        iconColor: _getColorFromState(),
                        backgroundButtonColor: const Color(0x00FFFFFF),
                        containerPadding: 0,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        _getTextFromState(),
                      )
                    ],
                  ),
                  Text(
                    widget.type,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 150, 150, 150)),
                  )
                ],
              ),
              if (_isActive)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Center(
                      child: Divider(
                    color: Color.fromARGB(255, 199, 199, 199),
                    thickness: 0.8,
                    height: 20,
                  )),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Precio p/ persona: ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('\$${widget.ticketPrice}'),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lugar: ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(widget.eventPlace)
                      ]),
                ]),
            ],
          ),
        ),
      ),
    );
  }

  _getColorFromState() {
    if (widget.eventState == 1) {
      return const Color(0xFF7CEA6E);
    } else if (widget.eventState == 2) {
      return const Color(0xFFE37474);
    } else if (widget.eventState == 3) {
      return const Color(0xFF6CAEFF);
    }
  }

  String _getTextFromState() {
    if (widget.eventState == 1) {
      return 'Activo';
    } else if (widget.eventState == 2) {
      return 'Suspendido';
    } else if (widget.eventState == 3) {
      return 'En proceso';
    } else {
      return '';
    }
  }
}
