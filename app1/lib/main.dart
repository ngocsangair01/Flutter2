import 'package:app1/Car.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(name: 'Hello', tuoi: 15));
}

class MyApp extends StatelessWidget {
  var name;
  var tuoi;

  MyApp({this.name, this.tuoi});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello ',
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello ',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
