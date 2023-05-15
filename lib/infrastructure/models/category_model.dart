// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Categories categoryFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoryToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final List<Category> categories;

  Categories({
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String name;
  final String urlImage;

  Category({
    required this.id,
    required this.name,
    required this.urlImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        urlImage: json["urlImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "urlImage": urlImage,
      };
}
