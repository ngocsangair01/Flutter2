import 'package:flutter/cupertino.dart';
import 'package:student_management/api/api_service.dart';
import 'package:student_management/models/subjects.dart';

import '../../../models/student.dart';

class StudentProvider extends ChangeNotifier{
  List<Student> students =[];
  bool loading = false;
  bool canLoadMore = false;
  Map<String,dynamic>? student;
  int nextPage = 1;
  String? search;
  int subjectId;

  StudentProvider(this.subjectId){
    getData(subjectId);
  }

  void getData(int subjectId)async {
    print('getdata');
    loading = true;
    print('getdata2');
    await ApiService().getApi().getAllStudentByIdSubject(subjectId).then((response){
      print('apiservice');
      loading = false;
      if(response.status =="SUCCESS"){
        var data = response.data;
        print(data);
        if(data== null){
          data = null;
        } else{
          data = List<Student>.from((response.data as List).map((e) => Student.fromJson(e))).toList();
        }
        students = data??students;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}