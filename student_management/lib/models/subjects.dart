// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
  Subject({
    required this.subjectName,
    required this.room,
    required this.address,
    required this.lesson,
    required this.timeDetail,
  });

  final String subjectName;
  final String room;
  final String address;
  final String lesson;
  final String timeDetail;

  Subject copyWith({
    required String subjectName,
    required String room,
    required String address,
    required String lesson,
    required String timeDetail,
  }) =>
      Subject(
        subjectName: subjectName ?? this.subjectName,
        room: room ?? this.room,
        address: address ?? this.address,
        lesson: lesson ?? this.lesson,
        timeDetail: timeDetail ?? this.timeDetail,
      );

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectName: json["subjectName"],
    room: json["room"],
    address: json["address"],
    lesson: json["lesson"],
    timeDetail: json["timeDetail"],
  );

  Map<String, dynamic> toJson() => {
    "subjectName": subjectName,
    "room": room,
    "address": address,
    "lesson": lesson,
    "timeDetail": timeDetail,
  };
}
