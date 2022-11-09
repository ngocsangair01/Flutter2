import 'dart:math';

class Food {
  int? id;
  String? name;
  late String urlName;
  Duration? duration;
  Complexity? complexity;
  List<String>? ingredients = <String>[];
  int? categoryId;
  Food({this.name,required this.urlName,this.duration,this.complexity,this.ingredients,this.categoryId}){
    this.id = Random().nextInt(1000);
  }
}

enum Complexity {
  Simple,
  Medium,
  Hard
}