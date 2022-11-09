import 'package:flutter/material.dart';
import 'package:food_app/fake_data.dart';
import 'package:food_app/models/category.dart';

import 'detail_food_page.dart';
import 'models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category? category;

  FoodsPage({this.category});


  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    this.category = arguments['category'];
    List<Food> foods = fake_food
        .where((food) => food.categoryId == this.category!.id)
        .toList();
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/DetailFoodPage':(context) => DetailFoodPage(),
      // },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food page'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              Food food = foods[index];
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => DetailFoodPage(food: food,)
                      )
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: Column(
                            children: [
                              FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/amalie-steiness.gif',
                                  image: food.urlName),
                              Text('${food.name}')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 25,
                            ),
                            Text(
                              '${food.duration!.inMinutes} minutes',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${food.complexity.toString()}',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 200,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 25,
                            ),
                            Text(
                              '${food.name}',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
