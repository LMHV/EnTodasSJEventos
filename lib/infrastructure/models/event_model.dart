// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventFromJson(String str) => Events.fromJson(json.decode(str));

String eventToJson(Events data) => json.encode(data.toJson());

class Events {
  final List<Event> events;

  Events({
    required this.events,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  final int id;
  final String title;
  final int eventState;
  final String category;
  final String type;
  final double ticketPrice;
  final String eventPlace;

  Event({
    required this.id,
    required this.title,
    required this.eventState,
    required this.category,
    required this.type,
    required this.ticketPrice,
    required this.eventPlace,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        eventState: json["eventState"],
        category: json["category"],
        type: json["type"],
        ticketPrice: json["ticketPrice"].toDouble(),
        eventPlace: json["eventPlace"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "eventState": eventState,
        "category": category,
        "type": type,
        "ticketPrice": ticketPrice,
        "eventPlace": eventPlace,
      };
}
