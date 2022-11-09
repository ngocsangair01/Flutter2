import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/categories_page.dart';
import 'package:food_app/foods_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food app with navigation',
      initialRoute: '/',
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'DancingScript-VariableFont_wght',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 52, 52, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 52, 52, 1),
              ),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Food \'s category',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'DancingScript-VariableFont_wght'
          ),),
        ),
        body: CategoriesPage(),
      ),
    );
  }
}
