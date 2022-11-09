import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/components/show_loading.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/toast.dart';

class AddressDetailProvider extends ChangeNotifier{
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var villageController = TextEditingController();
  var companyController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void updateAddress(BuildContext context)async {
    ShowLoadingHud().showLoadingHud();
    String token =await SecureStorage().getValue(key: "token");
    if(token != ""){
      if(nameController.text == ""){
        ShowToast(context).showToast("Tên không thể để trống");
        return;
      }
      else if(phoneController.text == ""){
        ShowToast(context).showToast("Số điện thoại không thể để trống");
        return;
      }
      else if(villageController.text == ""){
        ShowToast(context).showToast("Địa chỉ chi tiết không thể để trống");
        return;
      }
      else if(provinceController.text == ""){
        ShowToast(context).showToast("Tên tỉnh không thể để trống");
        return;
      }
      else if(districtController.text == ""){
        ShowToast(context).showToast("Tên huyện không thể để trống");
        return;
      }
      var body = json.encode({
        "name" : nameController.text,
        "phone" : phoneController.text,
        "city" : provinceController.text,
        "district" : districtController.text,
        'village' : villageController.text
      });
      ApiService(token: token).getApi().createAddress(body).then((response){
        if(response.success??false){
          ShowLoadingHud().dismissLoadingHud();
          ShowToast(context).showToast("Thêm địa chỉ thành công");
          Navigator.of(context).pop();
        }
      });
    }
  }
}