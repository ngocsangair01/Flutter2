
import 'package:flutter/cupertino.dart';
import 'package:student_management/api/api_service.dart';
import 'package:student_management/models/student.dart';

class StudentDetailProvider extends ChangeNotifier{
  int subjectId;
  String studentCode;
  bool loading = false;
  bool canLoadMore = false;
  Map<String,dynamic>? student;

  StudentDetailProvider(this.subjectId, this.studentCode){
    getData();
  }

  void getData() async{
    loading = true;
    await ApiService().getApi().getStudentDetail(subjectId, studentCode).then((response){
      loading = false;
      if(response.status =="SUCCESS"){
        student = response.data;
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }
}