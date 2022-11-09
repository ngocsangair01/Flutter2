import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/components/show_loading.dart';
import 'package:minismart/ui/register/register_delegate.dart';

class RegisterProvider extends ChangeNotifier{
  late RegisterDelegate _delegate;

  set delegate(RegisterDelegate value) {
    _delegate = value;
  }

  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var cfPasswordController = TextEditingController();

  bool validate(){
    if(nameController.text.length <= 2){
      _delegate.onError("Tên phải lớn hơn 2 chữ cái");
      return false;
    }
    else if(surnameController.text.length <= 2){
      _delegate.onError("Họ phải lớn hơn 2 chữ cái");
      return false;
    }
    else if(!validateEmail(emailController.text)){
      _delegate.onError("Email không đúng định dạng");
      return false;
    }
    else if(passwordController.text.length < 6){
      _delegate.onError("Mật khẩu phải lớn hơn 6 chữ số");
      return false;
    }
    else if(cfPasswordController.text != passwordController.text){
      _delegate.onError("Nhập lại mật khẩu không đúng");
      return false;
    }
    return true;
  }

  void register(){
    if(validate()){
      ShowLoadingHud().showLoadingHud();
      var body = {
       "name" : nameController.text,
       "surname" : surnameController.text,
       "phoneController" : phoneController.text,
       "email" : emailController.text,
       "password" : passwordController.text,
      };
      var jsonBody = json.encode(body);
      ApiService().getApi().register(jsonBody).then((response) {
        ShowLoadingHud().dismissLoadingHud();
        if(response.success??false){
          _delegate.onSuccess("Đăng kí thành công.");
        }
        else{
          _delegate.onError(response.message??"");
        }
      });
    }
  }


  bool validateEmail(String email) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email)) {
      return false;
    }
    return true;
  }

}