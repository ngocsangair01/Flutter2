import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  static const _storage = FlutterSecureStorage();

  Future save({required String key,required String value}) async {
    _storage.write(key: key, value: value);
  }

  Future<String> getValue({required String key})async {
    String? val =  await _storage.read(key: key);
    return val??"";
  }
  removeAccount(){
    _storage.delete(key: "account");
  }
  removeToken(){
    _storage.delete(key: "token");
    _storage.delete(key: "refreshToken");
  }
  removeUser(){
    _storage.delete(key: "user");
  }


  Future<bool> checkAdmin() async {
    var user = json.decode(await getValue(key: "user")) ;
    return user['role'] == 'admin';
  }

}