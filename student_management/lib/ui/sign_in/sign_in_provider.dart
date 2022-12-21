import 'package:flutter/material.dart';
import 'package:student_management/ui/sign_in/sign_in_delegate.dart';
import 'dart:convert';

import '../../api/api_service.dart';
import '../../components/show_loading.dart';
import '../../utils/secure_storage.dart';

class LoginProvider extends ChangeNotifier{
  late SignInDelegate _delegate;
  set delegate(SignInDelegate value) {
    _delegate = value;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool validate() {
    print('validate');
    if (emailController.text.length == 0||passwordController.text.length==0) {
      print('false');
      _delegate.showError("Các trường dữ liệu không được để trống");
      return false;
    }else{
      print('true');
      return true;
    }
  }

  bool loading = false;

  void login() async {
    print('login');
    if(validate()){
      ShowLoadingHud().showLoadingHud();
      print('show loading');
      var user = {
        "username" : emailController.text.toString(),
        "password" : passwordController.text.toString()
      };
      print('jsonbody');
      var jsonBody = json.encode(user);
      print('donejsonbody');
      ApiService().getApi().login(jsonBody).then((response) async {
        print('dismissloadinghud');
        ShowLoadingHud().dismissLoadingHud();
        loading = false;
        if(response.status=="SUCCESS"){
          _delegate.showSuccess("Đăng nhập thành công.");
          print(response.data);
          _delegate.loginSuccess();
        }
        else {
          _delegate.showError("Tài khoản hoặc mật khẩu không hợp lệ.");
          _delegate.loginError("Tài khoản hoặc mật khẩu không hợp lệ");
        }
        notifyListeners();
      });
    }
    notifyListeners();
  }


}