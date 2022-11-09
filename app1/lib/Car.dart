import 'package:flutter/material.dart';

class Car {
  var name;
  var age;


  Car({this.name, this.age});

  @override
  String toString() {
    return 'Car{name: $name, age: $age}';
  }
  void doSomething(){
    print('Hello');
  }
}