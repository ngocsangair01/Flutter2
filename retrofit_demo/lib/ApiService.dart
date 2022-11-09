import 'dart:developer';
import 'dart:io';


import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'package:thegioivaymobile/components/utils/Preferences.dart';
import 'package:thegioivaymobile/firebase/PushNotificationsManager.dart';

import 'Api.dart';


class ApiService {
  static ApiService _instance;

  static final _dio = Dio();
  static var _retrolfit;
  Map<String, String> get mapHeader =>Map<String, String>.from(_dio.options.headers);
  static String _token = "";

  ApiService();

  static ApiService getInstance({bool postFile}) {
    if (_instance == null) {
      // the 1st when login
      _instance = ApiService._internal();
    }
    _dio.options.headers["FCM-TOKEN"] = PushNotificationsManager().fcmToken;//PushNotificationsManager().fcmToken;

    _token = Preferences().getToken();
      print("token: "+_token);
    _dio.options.headers["sToken"] = "$_token";
    if(postFile??false){
      _dio.options.headers.remove("Content-Type");
    }else{
      _dio.options.headers["Content-Type"] = "application/json";

    }
    return _instance;
  }

  ApiService._internal() {
    // init Headers
    _instance = ApiService();
    _dio.options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        contentType: "application/json");
    if (Platform.isAndroid) {
      _dio.options.headers["OS-NAME"] = "android";
      _dio.options.headers["OS-VERSION"] = "9.9.9";
    } else {
      _dio.options.headers["OS-NAME"] = "ios";
      _dio.options.headers["OS-VERSION"] = "9.9.9";
    }
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      _dio.options.headers["APP-VERSION"] = packageInfo.version;


    });


    _dio.options.headers["DEVICE-CODE"] = Preferences().getDeviceCode();
    _dio.options.headers["DEVICE-TOKEN"] = Preferences().getDeviceToken();

    _getDeviceName().then((value) {
      _dio.options.headers["DEVICE-NAME"] = value.replaceAll(new RegExp('[^\u0001-\u007F]'),'_');
    });
  }

  Api getAPI() {
    _retrolfit = Api(_dio);
    return _retrolfit;
  }

  static Future<String> _getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.brand + androidInfo.model + androidInfo.device;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name + iosInfo.model;
    }
    return "";
  }


}