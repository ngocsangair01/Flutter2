import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/order.dart';
import 'package:minismart/util/secure_storage.dart';

class OrderProvider extends ChangeNotifier{
  bool loading = false;
  List<Order> orders = [];

  OrderProvider(){
    getListOrders();
  }

  getListOrders() async {
    loading = true;
    var token = await SecureStorage().getValue(key: 'token');
    ApiService(token: token).getApi().getAllOrders().then((response){
      loading = false;
      if(response.success??false){
        var data = response.data == null ?null
            : List<Order>.from((response.data['orders'] as List).map((e) => Order.fromJson(e))).toList();
        orders = data??orders;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}