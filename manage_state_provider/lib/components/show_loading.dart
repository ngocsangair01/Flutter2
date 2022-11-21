import 'package:bmprogresshud/progresshud.dart';
import 'package:flutter/material.dart';
import './base_view.dart';

class ShowLoadingHud{
  static final ShowLoadingHud _instance = ShowLoadingHud._internal();
  ShowLoadingHud._internal();
  factory ShowLoadingHud(){
    // _instance.init(context)
    return _instance;
  }
  init(BuildContext context){
    process = ProgressHud.of(context);
  }
  static ProgressHudState? process;
  static bool? processing;

  showLoadingHud()async{
    BaseView.showLoading = true;
    if(!(BaseViewState.stream.isClosed)) {
      BaseViewState.stream.add(true);
      Future.delayed(const Duration(milliseconds: 60000), (){
        if(BaseView.showLoading){
          dismissLoadingHud();
        }
      });
    }
  }

  dismissLoadingHud(){
    BaseView.showLoading = false;
    if(!(BaseViewState.stream.isClosed)) {
      BaseViewState.stream.add(false);
    }
  }

}