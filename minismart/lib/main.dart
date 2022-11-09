import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minismart/api/api_service.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/ui/splash/splash_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/styles.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: bgColor,
        primarySwatch: primaryMaterialColor,
        primaryColor: primaryMaterialColor,
        primaryColorLight: primaryMaterialColor,
        primaryColorDark: primaryMaterialColor,
        fontFamily: 'Gotham'
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Init init = Init();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Init>(
      future: init.setInit(context),
      builder: (context, snapshot) => const SplashScreen()
        );
  }
}

class Init {
  Future<Init> setInit(BuildContext context)async{
    ApiService().getApi();
    SizeConfig().init(context);

    return Init();
  }    // String categories = await SecureStorage().getValue(key: "categories");
// if(categories == ""){
//   ApiService().getApi().getCategories().then((response){
//     if(response.success??false){
//       SecureStorage().save(key: "categories", value: json.encode(response.data["categories"]));
//     }
//   });
// }
}

