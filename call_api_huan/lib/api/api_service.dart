import 'dart:convert';
import 'dart:io';
import './api.dart';
import 'package:dio/dio.dart';
import '../utils/secure_storage.dart';
class ApiService{
  static late ApiService _instance;
  static final _dio = Dio();
  static dynamic _retrofit;
  String token = "";
  static bool _checkInitialized = true;

  ApiService._internal() {

    _dio.options = BaseOptions(
      receiveTimeout: 60000,
      connectTimeout: 60000,
      contentType: "application/json",
    );

  }

  factory ApiService({String? token}) {

    if(_checkInitialized){
      _instance = ApiService._internal();
      _checkInitialized = false;
    }
    // _instance.getToken();
    if(token != null){
      _dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
      print(token);
    }
    else{
      _dio.options.headers.remove(HttpHeaders.authorizationHeader);
    }

    return _instance;
  }

  getToken() async{
    token = await SecureStorage().getValue(key: "token");
  }

  Api getApi(){
    _retrofit = Api(_dio);
    return _retrofit;
  }

}