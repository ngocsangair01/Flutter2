import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:minismart/model/post.dart';

class FeedDetailScreen extends StatefulWidget {
  final Post post;

  const FeedDetailScreen({Key? key,required this.post}) : super(key: key);

  @override
  _FeedDetailScreenState createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
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
                child: Image.network(widget.post.pictures[0],fit: BoxFit.fitWidth,width: double.infinity),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                  child: HtmlWidget(widget.post.description))
            ],
          ),
        ),
      ),
    );
  }
}
