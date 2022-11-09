import 'package:flutter/material.dart';
import 'package:minismart/utils/colors.dart';
import 'package:minismart/utils/styles.dart';
void main(){
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
          fontFamily: 'Gotham'
      ),
      home: MyHomePage(title: 'Hello',),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Init init = Init();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Init{
  Future<Init> setInit(BuildContext context) async{
    SizeConfig().init(context);
    return Init();
  }
}