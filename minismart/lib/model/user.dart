// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.role,
    required this.favoriteProducts,
    required this.deliveryAddress,
    required this.v,
  });

  final String id;
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String role;
  final List<dynamic> favoriteProducts;
  final List<dynamic> deliveryAddress;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    surname: json["surname"],
    phone: json["phone"],
    email: json["email"],
    role: json["role"],
    favoriteProducts: List<dynamic>.from(json["favoriteProducts"].map((x) => x)),
    deliveryAddress: List<dynamic>.from(json["deliveryAddress"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "surname": surname,
    "phone": phone,
    "email": email,
    "role": role,
    "favoriteProducts": List<dynamic>.from(favoriteProducts.map((x) => x)),
    "deliveryAddress": List<dynamic>.from(deliveryAddress.map((x) => x)),
    "__v": v,
  };
}
