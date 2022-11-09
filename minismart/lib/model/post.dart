
import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.pictures,
    required this.postedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String title;
  final String description;
  final List<String> pictures;
  final String postedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    pictures: List<String>.from(json["pictures"].map((x) => x)),
    postedBy: json["postedBy"]??"",
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "pictures": List<dynamic>.from(pictures.map((x) => x)),
    "postedBy": postedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
