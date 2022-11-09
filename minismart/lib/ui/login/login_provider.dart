import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/components/show_loading.dart';
import 'package:minismart/model/user.dart';
import 'package:minismart/ui/login/login_delegate.dart';
import 'package:minismart/util/secure_storage.dart';

class LoginProvider extends ChangeNotifier{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginDelegate _delegate;


  set delegate(LoginDelegate value) {
    _delegate = value;
  }

  bool loading = false;

  void login() async {
    loading = true;
    var user = {
      "email" : emailController.text.toString(),
      "password" : passwordController.text.toString()
    };
    var jsonBody = json.encode(user);
    ShowLoadingHud().showLoadingHud();
    ApiService().getApi().login(jsonBody).then((response) async {
      ShowLoadingHud().dismissLoadingHud();
      loading = false;
      if(response.success!){
        _delegate.showSuccess("Đăng nhập thành công.");
        SecureStorage().save(key: "account", value: jsonBody);
        await SecureStorage().save(key: "token", value: response.data['accessToken']);
        await SecureStorage().save(key: "refreshToken", value: response.data['refreshToken']);
        var x = await SecureStorage().getValue(key: "token");
        saveUserData(x);
      }
      else{
        _delegate.showError("Tài khoản hoặc mật khẩu không hợp lệ.");
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void saveUserData(String token){
    ApiService(token: token).getApi().getUser().then((response) async {
      if(response.success??false){
        var data = User.fromJson(response.data['user']);
        SecureStorage().save(key: "user", value: json.encode(data));
      }
    });
  }
}