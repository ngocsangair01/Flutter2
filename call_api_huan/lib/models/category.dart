// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Categoryy> categoryFromJson(String str) => List<Categoryy>.from(json.decode(str).map((x) => Categoryy.fromJson(x)));

String categoryToJson(List<Categoryy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoryy {
  Categoryy({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  Categoryy copyWith({
    required int id,
    required String name,
    required String description,
  }) =>
      Categoryy(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Categoryy.fromJson(Map<String, dynamic> json) => Categoryy(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
