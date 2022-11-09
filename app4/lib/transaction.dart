import 'package:flutter/material.dart';

class Transaction{
  String? email;
  String? password;
  Transaction(this.email,this.password);
  @override
  String toString() {
    // TODO: implement toString
    return 'email: $email, password: $password';
  }
}