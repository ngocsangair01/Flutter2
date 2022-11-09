
import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    required this.id,
    required this.user,
    required this.name,
    required this.phone,
    required this.company,
    required this.city,
    required this.district,
    required this.village,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String user;
  final String name;
  final String phone;
  final String company;
  final String city;
  final String district;
  final String village;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    user: json["user"],
    name: json["name"],
    phone: json["phone"],
    company: json["company"],
    city: json["city"],
    district: json["district"],
    village: json["village"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "name": name,
    "phone": phone,
    "company": company,
    "city": city,
    "district": district,
    "village": village,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
