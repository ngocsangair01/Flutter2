import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/user.dart';
import 'package:minismart/util/secure_storage.dart';

class UserProvider extends ChangeNotifier{
  User user = User(id: "id", name: "name", surname: "surname", phone: "phone", email: "email", role: "role", favoriteProducts: [], deliveryAddress: [], v: 1);
  bool loading = false;
  String token = "";

  UserProvider(){
    getUser();
  }


  void getUser() async {
    token = await SecureStorage().getValue(key: "token");
    if(token != ""){
      loading = true;
      // ApiService(token: token).getApi().getUser().then((response){
      //   loading = false;
      //   if(response.success??false){
      //     user = User.fromJson(response.data);
      //   }
      //   notifyListeners();
      // });
      SecureStorage().getValue(key: "user").then((response){
        loading = false;
        var data = json.decode(response);
        user = User.fromJson(data);
        notifyListeners();
      });
      notifyListeners();
    }
    notifyListeners();
  }
}