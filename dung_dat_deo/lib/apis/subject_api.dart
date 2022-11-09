import 'dart:convert';

import 'package:dung_dat_deo/models/Subject.dart';
import 'package:http/http.dart' as http;
Future<List<Subject>> getSubject() async{
  final String url = "http://20.196.66.22:7000/class/api/v1/subjects/";
  final response = await http.get(Uri.parse(url));
  final responseData = json.decode(response.body);
  try{
    if(response.statusCode == 200){
      final apiSubject = ApiSubject.fromJson(responseData);
          return apiSubject.data.subjects;
        } else{
          print('1');
          return [];
        }
      }catch(exception){
        print('2');
        return [];
  }
}