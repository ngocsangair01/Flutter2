

import '../../api/api_service.dart';
import 'package:flutter/cupertino.dart';

import '../../models/subjects.dart';

class SubjectProvider extends ChangeNotifier{
  List<Subject> subjects = [];
  bool loading = false;
  bool canLoadMore = false;
  Map<String,dynamic>? subject;
  int nextPage = 1;
  String? search;
  SubjectProvider(){
    getData();
  }
  getData() async{
    loading = true;
    ApiService().getApi().getTimeTables().then((response){
      loading = false;
      if(response.status=='SUCCESS'){
        // var data = response.data == null
        //     ? null
        //     : List<Subject>.from((response.data["items"] as List)
        //     .map((e) => Subject.fromJson(e))).toList();
        var data1 = response.data;
        if(data1 == null){
          data1 = null;
        }
        else{
          data1 = List<Subject>.from((response.data["items"] as List) .map((e) => Subject.fromJson(e))).toList();
        }
        subjects = data1 ?? subjects;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}