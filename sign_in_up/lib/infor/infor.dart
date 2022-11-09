import 'dart:ffi';

import 'package:flutter/material.dart';

class Infor extends StatelessWidget {
  int? id;
  String? name;
  int? age;
  String? address;
  String? account;
  String? password;

  Infor({this.id, this.name, this.age, this.address, this.account, this.password});

  // @override
  // String toString() {
  //   return 'Infor{id: $id, name: $name, age: $age, address: $address, account: $account, password: $password}';
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Text('${this.id}'),
          Text('${this.name}'),
          Text('${this.age}'),
          Text('${this.address}'),
          Text('${this.account}'),
          Text('${this.password}'),
        ],
      ),
    );
  }

// Infor({this.id,this.name,this.age,this.address,this.account,this.password});

}
