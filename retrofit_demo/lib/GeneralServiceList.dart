

import 'package:thegioivaymobile/view/ShowLoadingHud.dart';

class GeneralServiceList<T> {

  List<dynamic> data;
  String message;
  String code;
  String status;


  GeneralServiceList.fromJson(Map<String, dynamic> map){
     data = map["data"];
    message = map["message"];
    code = map["code"];
    status = map["status"];
     if((map["code"] as String).contains("E")){
       ShowLoadingHud().intent(data: map);
     }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = data;
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    return data;
  }
}
