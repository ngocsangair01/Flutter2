import 'package:infinite_list_app/blocs/imagea_bloc.dart';
import 'package:infinite_list_app/models/images.dart';
import 'package:infinite_list_app/my_app.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SafeArea(
          child: Builder(
            builder: (context) => InfiniteList(),
          ),
        ),
    );
  }
}

