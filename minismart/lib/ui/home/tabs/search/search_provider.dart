import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/category.dart';

class SearchProvider extends ChangeNotifier{
  static final SearchProvider _instance = SearchProvider._internal();
  bool loading = false;
  SearchProvider._internal(){
    getCategories();
  }
  List<Category> categories = [];
  factory SearchProvider(){
    return _instance;
  }
  void getCategories(){
    loading = true;
    ApiService().getApi().getCategories().then((response) {
      loading = false;
      if(response.success??false){
        var data = response.data == null ?null
            : List<Category>.from((response.data['categories'] as List).map((e) => Category.fromJson(e))).toList();
        categories = data??categories;
      }
      notifyListeners();
    });
    notifyListeners();
  }

}