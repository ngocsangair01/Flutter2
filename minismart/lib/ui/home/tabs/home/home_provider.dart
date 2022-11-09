import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/api/pagination.dart';
import 'package:minismart/model/product.dart';

class HomeProvider with ChangeNotifier{
  List slideImage = [
    "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    "assets/images/banner_3.jpg",
  ];
  //list sản phẩm bán chạy nhất
  List<Product> products = [];
  //list sản phầm đồ khô
  List<Product> bestSellProducts = [];
  //list sản phẩm rau quả
  List<Product> productsVegetable = [];

  bool loading = false;

  int nextPage = 1;
  int total = 0;

  bool isLoadingMore = false;

  static HomeProvider? _instance;

  HomeProvider._internal();

  factory HomeProvider(){
    if(_instance == null){
      _instance = HomeProvider._internal();
      _instance?.getData();
      _instance?.getBestSellProduct();
    }
    return _instance??HomeProvider._internal();
  }



  void getData(){
    loading = true;
    ApiService().getApi().getAllProducts(limit: 8).then((response){
      loading = false;
      if(response.success??false){
        var data = response.data == null ?null
            : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
        products = data??products;
        Pagination pagination = Pagination.fromJson(response.data['pagination']);
        nextPage = pagination.next;
        total = pagination.total;
      }
      notifyListeners();
    });
    notifyListeners();
  }

  getBestSellProduct(){
    ApiService().getApi().getAllProducts(sort: "-sellNumber").then((response){
      if(response.success??false){
        var data = response.data == null ?null
            : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
        bestSellProducts = data??bestSellProducts;
      }
      notifyListeners();
    });
  }

  loadMore() async {
    isLoadingMore = true;
    ApiService().getApi().getAllProducts(limit: 8,page: nextPage).then((response){
      isLoadingMore = false;
      if(response.success??false){
        var data = response.data == null ?null
            : List<Product>.from((response.data['products'] as List).map((e) => Product.fromJson(e))).toList();
        products.addAll(data??<Product>[]);
        Pagination pagination = Pagination.fromJson(response.data['pagination']);
        nextPage = pagination.next;
      }
      notifyListeners();
    });
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _instance = null;
  }

}