import 'package:flutter/cupertino.dart';
import '../../api/api_service.dart';
import '../../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categoryy> categories = [];
  bool loading = false;
  bool canLoadMore = true;
  Map<String, dynamic>? category;
  int nextPage = 1;
  String? search;

  CategoryProvider() {
    getData();
  }

  void getData() {
    loading = true;
    ApiService().getApi().viewAllCategory().then((response) {
      loading = false;
      if (response.status == 200) {
        var data = response.results == null
            ? null
            : List<Categoryy>.from((response.results as List)
                .map((e) => Categoryy.fromJson(e))).toList();
        categories = data ?? categories;
      }
      notifyListeners();
    });
    notifyListeners();
  }
  void loadMore() async {
    if(canLoadMore){
      if(category == null) {
        ApiService().getApi().viewAllCategory().then((response){
          if(response.status == 200){
            var data = response.results == null ?null
                : List<Categoryy>.from((response.results as List).map((e) => Categoryy.fromJson(e))).toList();
            // products.addAll(data??<Product>[]);
          }
          notifyListeners();
        });
      }
    }
  }
}
