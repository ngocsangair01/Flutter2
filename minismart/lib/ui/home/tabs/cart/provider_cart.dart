import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/address.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/toast.dart';

class CartProvider extends ChangeNotifier{
  List<Map<String,dynamic>> listCart = [];
  bool loading = false;
  CartProvider(){
    getAllCart();
  }

  void getAllCart() async {
    loading = true;
    String token = await SecureStorage().getValue(key: "token");
    String refreshToken = await SecureStorage().getValue(key: "refreshToken");
    var jsonBody = json.encode({"refreshToken" : refreshToken});
    if(token != ""){
      ApiService(token: token).getApi().getCart(jsonBody).then((response){
        loading = false;
        if(response.success??false){
          var cart = response.data['cart'];
          List<Product> products = (cart['products'] as List).map((e) => Product.fromJson(e)).toList();
          List<int> quantitys = (cart['quantity'] as List).map((e) => e as int).toList();
          for(int i = 0; i<quantitys.length;i++){
            listCart.add({
              'product': products[i],
              'quantity':quantitys[i]
            });
          }
        }
        notifyListeners();
      });
    }
    else{
      getLocalCart();
    }

    notifyListeners();
  }

  void removeCart(int index,String id, BuildContext context) async {
    String token = await SecureStorage().getValue(key: "token");
    if(token != ""){
      ApiService(token: token).getApi().deleteCart(id).then((response) {
        if(response.success??false){
          ShowToast(context).showToast("Xóa sản phẩm thành công");
          listCart.removeAt(index);
          notifyListeners();
        }
      });
    } else {
      listCart.removeAt(index);
      SecureStorage().updateCart(listCart);
    }
    // notifyListeners();
  }
  int calculatorTotalMoney(){
    int total = 0;
    for(var e in listCart){
      Product product = e['product'];
      total += product.price *  int.parse(e['quantity'].toString());
    }
    return total;
  }

  getLocalCart(){
    SecureStorage().getLocalCart().then((value){
      loading = false;
      listCart = value;
      listCart = listCart.map((e) {
        e['product'] = Product.fromJson(e['product'] is String ? json.decode(e['product']) : e['product']);
        return e;
      }).toList();
      print("");
      notifyListeners();
    });
  }
}

class CartBottomSheetProvider extends ChangeNotifier{
  Address? address;
  bool loading = false;

  bool checkIsLogin = false;

  CartBottomSheetProvider(){
    getAddress();
  }

  getAddress() async {
    loading = true;
    var token = await SecureStorage().getValue(key: 'token');

    if(token != ""){
      checkIsLogin = true;
      ApiService(token: token).getApi().getAddress().then((response){
        loading = false;
        if(response.success??false){
          var data = response.data == null ?null
              : List<Address>.from((response.data['address'] as List).map((e) => Address.fromJson(e))).toList();
          address = data!.isEmpty?null:data[0];
        }
        notifyListeners();
      });
    }
    else{
      checkIsLogin = false;
      loading = false;
    }
    notifyListeners();
  }


  createOrder(List<Map<String,dynamic>> carts,int totalMoney,BuildContext context)async {
    var token = await SecureStorage().getValue(key: 'token');


    List<String> productIds = [];
    List<int> quantitys = [];

    for(var e in carts){
      Product product = e['product'];
      int quantity = e['quantity'];
      productIds.add(product.id);
      quantitys.add(quantity);
    }

    var jsonBody = json.encode({
      "name":address!.name,
      "email":address!.phone,
      "address":address!.village,
      "city":address!.city,
      "district":address!.district,
      "products":productIds,
      "quantity":quantitys,
      "sumMoney" : totalMoney
    });

    ApiService(token: token).getApi().createOrder(jsonBody).then((response){
      if(response.success??false){
        ShowToast(context).showToast("Đặt hàng thành công");
        Navigator.pop(context);
      }
    });
  }
}