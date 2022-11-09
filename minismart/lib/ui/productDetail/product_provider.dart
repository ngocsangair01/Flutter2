import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/toast.dart';

class ProductDetailProvider extends ChangeNotifier{
  late Product product;
  int quantity = 1;

  ProductDetailProvider(this.product);

  void increaseQuantity(){
    quantity++;
    print(quantity);
    notifyListeners();
  }

  void decreaseQuantity(){
    quantity--;
    print(quantity);
    notifyListeners();
  }
  @override
  void dispose() {
    super.dispose();
  }

  addToCart(BuildContext context, Product product, int quantity) async {

    String token = await SecureStorage().getValue(key: 'token');
    if(token != ""){
      var jsonBody = json.encode({
        "productId":product.id,
        "quantity":quantity
      });
      ApiService(token: token).getApi().addToCart(jsonBody).then((response){
        if(response.success??false){
          ShowToast(context).showToast("Thêm vào giỏ hàng thành công.");
          Navigator.of(context).pop();
        }
      });
    }
    else{
      ShowToast(context).showToast("Thêm vào giỏ hàng thành công.");
      SecureStorage().saveLocalCart(product, quantity).then((value) => print("oke"));
      Navigator.of(context).pop();
    }


  }
}