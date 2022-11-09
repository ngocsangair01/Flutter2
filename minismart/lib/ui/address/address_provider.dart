import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/model/address.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/toast.dart';

class AddressProvider extends ChangeNotifier{

  List<Address> listAddress = [];
  bool loading = false;

  AddressProvider(){
    getListAddress();
  }

  refresh(){
    getListAddress();
    notifyListeners();
  }

  getListAddress() async {
    loading = true;
    var token = await SecureStorage().getValue(key: 'token');

    if(token != ""){
      ApiService(token: token).getApi().getAddress().then((response){
        loading = false;
        if(response.success??false){
          var data = response.data == null ?null
              : List<Address>.from((response.data['address'] as List).map((e) => Address.fromJson(e))).toList();
          listAddress = data??listAddress;
        }
        notifyListeners();
      });
    }

    notifyListeners();
  }

  deleteAddress(String id,BuildContext context) async {
    var token = await SecureStorage().getValue(key: 'token');
    ApiService(token: token).getApi().deleteAddress(id).then((response) {
      if(response.success??false){
        ShowToast(context).showToast("Xóa địa chỉ thành công");
        for(int i = 0; i < listAddress.length; i++){
          if(listAddress[i].id == id){
            listAddress.removeAt(i);
            break;
          }
        }
        notifyListeners();
      }
    });
  }
}