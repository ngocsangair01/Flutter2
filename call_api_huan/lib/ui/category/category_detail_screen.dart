import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/category.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Categoryy categoryy;

  const CategoryDetailScreen({Key? key, required this.categoryy})
      : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bài viết"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                height: 200,
                width: double.infinity,
                // child: Image.network(widget.post.pictures[0],fit: BoxFit.fitWidth,width: double.infinity),
                child: Text(widget.categoryy.name),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(widget.categoryy.description)),
            ],
          ),
        ),
      ),
    );
  }
}
