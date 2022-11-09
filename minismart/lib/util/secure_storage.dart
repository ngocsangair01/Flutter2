import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minismart/model/product.dart';

class SecureStorage{
  static const _storage = FlutterSecureStorage();

  Future saveLocalCart(Product product,int quantity) async{
    Map<String,dynamic> cart = {};
    cart['product'] = json.encode(product);
    cart['quantity'] = json.encode(quantity);
    var listCart = await getLocalCart();
    bool check = true;
    var data =  listCart.map((e) {
      e['product'] = Product.fromJson(e['product'] is String ? json.decode(e['product']) : e['product']);
      return e;
    }).toList();
    for(var e in data){
      if((e['product'] as Product).id == product.id){
        e['quantity'] = json.encode(quantity);
        check = false;
        break;
      }
    }
    if(check) listCart.add(cart);
    _storage.write(key: "list_cart", value: json.encode(listCart));
  }

  Future<List<Map<String,dynamic>>> getLocalCart() async{
    List<Map<String,dynamic>> listCart = [];
    String? jsonBody = await _storage.read(key: "list_cart");
    if(jsonBody != null){
      listCart = (json.decode(jsonBody) as List).map((e){
        Map<String,dynamic> cart = {};
        cart['product'] = e['product'];
        cart['quantity'] = e['quantity'];
        return cart;
      }).toList();
    }
    return jsonBody != null ? listCart : [];
  }

  void updateCart(List<Map<String,dynamic>> list) async {
    _storage.write(key: "list_cart", value: json.encode(list));
  }

  Future save({required String key,required String value}) async {
    _storage.write(key: key, value: value);
  }

  Future<String> getValue({required String key})async {
    String? val =  await _storage.read(key: key);
    return val??"";
  }
  removeAccount(){
    _storage.delete(key: "account");
  }
  removeToken(){
    _storage.delete(key: "token");
    _storage.delete(key: "refreshToken");
  }
  removeUser(){
    _storage.delete(key: "user");
  }


  Future<bool> checkAdmin() async {
    var user = json.decode(await getValue(key: "user")) ;
    return user['role'] == 'admin';
  }

}