// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:minismart/model/product.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.id,
    required this.user,
    required this.name,
    required this.email,
    required this.address,
    required this.note,
    required this.products,
    required this.quantity,
    required this.city,
    required this.district,
    required this.sumMoney,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String user;
  final String name;
  final String email;
  final String address;
  final String note;
  final List<Product> products;
  final List<int> quantity;
  final String city;
  final String district;
  final int sumMoney;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"],
    user: json["user"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    note: json["note"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    quantity: List<int>.from(json["quantity"].map((x) => x)),
    city: json["city"],
    district: json["district"],
    sumMoney: json["sumMoney"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "name": name,
    "email": email,
    "address": address,
    "note": note,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "quantity": List<dynamic>.from(quantity.map((x) => x)),
    "city": city,
    "district": district,
    "sumMoney": sumMoney,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

