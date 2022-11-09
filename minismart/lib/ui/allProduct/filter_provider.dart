import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/api/pagination.dart';
import 'package:minismart/model/product.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterProvider extends ChangeNotifier{
  final PanelController slideUpController = PanelController();
  String? sort;
  String? search;
  Map<String, dynamic>? category;
  List<Product> products = [];
  int nextPage = 1;
  bool canLoadMore = true;
  int total = 0;
  bool loading = false;


  FilterProvider({this.sort, this.search,this.category}){
    getData();
  }

  void getData({String? mSort}){
    loading = true;
    if(category == null){
      ApiService().getApi().getAllProducts(search: search,sort: mSort,limit: 8).then((response){
        loading = false;
        if(response.success??false){
          var data = response.data == null ?null
              : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
          products = data??products;
          Pagination pagination = Pagination.fromJson(response.data['pagination']);
          pagination.next == 0 ? canLoadMore = false : nextPage = pagination.next;
          total = pagination.total;

        }
        notifyListeners();
      });
    }
    else{
      ApiService().getApi().getAllProducts(limit: 63).then((response){
        loading = false;
        if(response.success??false){
          var data = response.data == null ?null
              : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
          products = data??products;
          products = products.where((element) {
            return element.category == category?['id'];
          }).toList();
          Pagination pagination = Pagination.fromJson(response.data['pagination']);
          pagination.next == 0 ? canLoadMore = false : nextPage = pagination.next;
          total = pagination.total;

        }
        notifyListeners();
      });
    }
    notifyListeners();
  }

  loadMore() async {
    if(canLoadMore){
      if(category == null) {
        ApiService().getApi().getAllProducts(limit: 8,page: nextPage,search: search,sort: sort).then((response){
        if(response.success??false){
          var data = response.data == null ?null
              : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
          products.addAll(data??<Product>[]);
          Pagination pagination = Pagination.fromJson(response.data['pagination']);
          pagination.next == 0 ? canLoadMore = false : nextPage = pagination.next;
        }
        notifyListeners();
      });
      }
    }
  }

  void onButtonFilterClick() async{
    search = "";
    slideUpController.isAttached?slideUpController:(){};
    switch(sort){
      case "Tên":
        getData(mSort: "name");
        break;
      case "Giá tiền":
        getData(mSort: "price");
        break;
      case "Số lượng đã bán":
        getData(mSort: "sellNumber");
        break;
    }
  }
}