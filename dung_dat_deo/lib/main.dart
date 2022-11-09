import 'package:dung_dat_deo/dung.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      home: Scaffold(
        body: SafeArea(
          child: Dung(),
        ),
      ),
    );
  }
}
