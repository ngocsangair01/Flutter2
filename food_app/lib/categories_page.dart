import 'package:flutter/material.dart';
import 'package:food_app/category_item.dart';
import 'package:food_app/fake_data.dart';
class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      //convert categories array => category_item, use map()
      children: fake_category.map((e) => CategoryItem(category: e)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 4/2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12
        ),);
  }
}
