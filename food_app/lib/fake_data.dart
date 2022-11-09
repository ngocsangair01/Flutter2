import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'models/category.dart';

final fake_category = [
  Category(id: 1, content: 'Japanese \'s food', color: Colors.blueAccent),
  Category(id: 2, content: 'Vietnamese \'s food', color: Colors.pink),
  Category(id: 3, content: 'Fast food', color: Colors.yellow),
  Category(id: 4, content: 'Hamburger \'s food', color: Colors.red),
  Category(id: 5, content: 'Vegetables', color: Colors.lightBlueAccent),
  Category(id: 6, content: 'Fruit', color: Colors.cyan),
  Category(id: 7, content: 'Meat', color: Color.fromRGBO(50, 50, 50, 100)),
  Category(id: 8, content: 'You', color: Colors.purpleAccent),
  Category(id: 9, content: 'Chinese \'s food', color: Colors.lightGreenAccent),
  Category(id: 10, content: 'Seafood', color: Colors.green),
];

final fake_food = [
  Food(
      name: 'Ga ham la ngai',
      urlName:
      'https://tonghoptintucmoinhatvinhbacbohome.files.wordpress.com/2020/12/ga-ham-ngai-cuu-2.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Chicken', 'La ngai', 'hat sen', 'rat nhieu thu khac'],
      categoryId: 2
  ),
  Food(
      name: 'Banh mi',
      urlName:
      'https://cdn.daotaobeptruong.vn/wp-content/uploads/2021/01/banh-mi-viet-nam.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Simple,
      ingredients: ['Chicken', 'La ngai', 'hat sen', 'rat nhieu thu khac'],
      categoryId: 2
  ),
  Food(
      name: 'shushi',
      urlName:
      'https://tonghoptintucmoinhatvinhbacbohome.files.wordpress.com/2020/12/ga-ham-ngai-cuu-2.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Chicken', 'La ngai', 'hat sen', 'rat nhieu thu khac'],
      categoryId: 1
  ),
  Food(
      name: 'Pizza',
      urlName:
      'https://tonghoptintucmoinhatvinhbacbohome.files.wordpress.com/2020/12/ga-ham-ngai-cuu-2.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Chicken', 'La ngai', 'hat sen', 'rat nhieu thu khac'],
      categoryId: 3
  ),
  Food(
      name: 'Rau muong',
      urlName:
      'https://tonghoptintucmoinhatvinhbacbohome.files.wordpress.com/2020/12/ga-ham-ngai-cuu-2.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Chicken', 'La ngai', 'hat sen', 'rat nhieu thu khac'],
      categoryId: 6
  ),
];
