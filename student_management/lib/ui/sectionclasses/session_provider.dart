
import 'package:flutter/cupertino.dart';
import '../../api/api_service.dart';
import '../../models/section_class.dart';

class SessionProvider extends ChangeNotifier{
  List<SectionClass> sectionClasses = [];
  bool loading = false;
  bool canLoadMore = false;
  Map<String,dynamic>? sectionClass;
  int nextPage = 1;
  String? search;
  SessionProvider(){
    getData();
  }
  getData() async{
    loading = true;
    await ApiService().getApi().getSubjects().then((response){
      loading = false;
      if(response.status=='SUCCESS'){
        // var data = response.data == null
        //     ? null
        //     : List<SectionClass>.from((response.data as List)
        //     .map((e) => SectionClass.fromJson(e))).toList();
        var data = response.data;
        if(data == null){
          data = null;
        }
        else{
          data = List<SectionClass>.from((response.data as List) .map((e) => SectionClass?.fromJson(e))).toList();
        }
        sectionClasses = data ?? sectionClasses;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}