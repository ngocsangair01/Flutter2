import 'package:flutter/material.dart';
import 'models/category.dart';
import 'foods_page.dart';
class CategoryItem extends StatelessWidget {
  Category category;

      CategoryItem({required this.category});

      @override
      Widget build(BuildContext context) {
        Color? _color = this.category.color;
        return InkWell(
          onTap: (){
            print('tap to category: ${this.category.content}');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //       builder:(context) => FoodsPage(category: this.category),
            //   ),
            // );
            Navigator.pushNamed(context, FoodsPage.routeName ,arguments: {'category': category});
          },
          splashColor: Colors.deepPurple,
          child: Container(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.category.content.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_color!.withOpacity(0.6), _color],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            color: _color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
