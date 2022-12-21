import 'package:student_management/ui/home.dart';
import 'package:student_management/ui/sign_in/sign_in_screen.dart';

import './utils/colors.dart';
import './utils/styles.dart';
import './api/api_service.dart';
import './ui/timetable/subject_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: bgColor,
          primarySwatch: primaryMaterialColor,
          primaryColor: primaryMaterialColor,
          primaryColorLight: primaryMaterialColor,
          primaryColorDark: primaryMaterialColor,
          fontFamily: 'Gotham'),
      home: MyHomePage(
        title: 'Hello',
      ),
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
        builder: (context,snapshot) => SignInScreen(),
    );
  }
}

class Init {
  Future<Init> setInit(BuildContext context) async {
    ApiService().getApi();
    SizeConfig().init(context);
    return Init();
  }
}
