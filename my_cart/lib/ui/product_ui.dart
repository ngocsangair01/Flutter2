import 'package:flutter/material.dart';
class ProductUI extends StatelessWidget {
  const ProductUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      highContrastDarkTheme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Day la app bar'),
        ),
        body: Container(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
