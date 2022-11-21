import 'package:call_api_huan/api/api_service.dart';
import 'package:call_api_huan/ui/category/category_screen.dart';
import 'package:call_api_huan/utils/colors.dart';
import 'package:call_api_huan/utils/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
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
      builder: (context,snapshot) => CategoryScreen(),
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
