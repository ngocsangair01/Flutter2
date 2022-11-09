// To parse this JSON data, do
//
//     final apiSubject = apiSubjectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ApiSubject {
  ApiSubject({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  factory ApiSubject.fromRawJson(String str) => ApiSubject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiSubject.fromJson(Map<String, dynamic> json) => ApiSubject(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.subjects,
  });

  final List<Subject> subjects;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    subjects: List<Subject>.from(json["items"].map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}

class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.avatar,
    required this.description,
  });

  final int id;
  final String name;
  final String avatar;
  final String description;

  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "description": description,
  };
}
