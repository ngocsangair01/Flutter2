// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Subject> subjectFromJson(String str) => List<Subject>.from(json.decode(str).map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  Subject copyWith({
    required int id,
    required String name,
    required String description,
  }) =>
      Subject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
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
