import 'package:flutter/material.dart';
class Imagea{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Imagea({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});
  factory Imagea.fromJson(Map<String,dynamic> json){
    return Imagea(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}