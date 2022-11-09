import 'package:flutter/material.dart';
import 'package:food_app/fake_data.dart';

import 'models/food.dart';

class DetailFoodPage extends StatelessWidget {
  static const String routeName = '/DetailFoodPage';
  Food? food;

  DetailFoodPage({this.food});
  void getDetailTest(){
    print('${food!.name}');
  }
  @override
  Widget build(BuildContext context) {
    // Map<String,Food> arguments = ModalRoute.of(context)!.settings.arguments as Map<String,Food>;
    // this.food = arguments['food']!;
    // Food food = fake_food.where((food) => food.id ==this.food?.id) as Food;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Food Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Hello'),
            Text('${food?.name}'),
          ],
        ),
      ),
    );
  }
}
