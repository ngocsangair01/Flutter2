// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.pictures,
    required this.price,
    required this.discount,
    required this.sellNumber,
    required this.country,
    required this.unit,
    required this.postedBy,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String title;
  final String description;
  final List<String> pictures;
  final int price;
  final dynamic discount;
  final int sellNumber;
  final String country;
  final String unit;
  final String postedBy;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    pictures: List<String>.from(json["pictures"].map((x) => x)),
    price: json["price"],
    discount: json["discount"],
    sellNumber: json["sellNumber"],
    country: json["country"],
    unit: json["unit"],
    postedBy: json["postedBy"],
    category: json["category"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "pictures": List<dynamic>.from(pictures.map((x) => x)),
    "price": price,
    "discount": discount,
    "sellNumber": sellNumber,
    "country": country,
    "unit": unit,
    "postedBy": postedBy,
    "category": category,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
