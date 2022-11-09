import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/post.dart';

class FeedProvider extends ChangeNotifier{
  List<Post> posts = [];

  bool loading = false;

  FeedProvider(){
    getData();
  }

  getData() async {
    loading = true;
    ApiService().getApi().getPost().then((response){
      loading = false;
      if(response.success??false){
        var data = response.data == null ?null
            : List<Post>.from((response.data['posts'] as List).map((e) => Post.fromJson(e))).toList();
        posts = data??posts;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}