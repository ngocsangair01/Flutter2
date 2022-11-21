
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class ShowToast{
  ShowToast(BuildContext context){
    ToastContext().init(context);
  }

  void showToast(String message){
    Toast.show(message,
              duration: Toast.lengthShort,
              gravity: Toast.bottom,
              backgroundColor: Colors.black54);
  }
}