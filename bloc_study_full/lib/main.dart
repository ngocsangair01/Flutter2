import 'package:bloc_study_full/Screen/builder.dart';
import './Screen/listener.dart';
import 'package:bloc_study_full/Screen/multiprovider.dart';
import './Screen/provider.dart';
import './Screen/selector.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedPage = 0;
  final _pageOptions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) => _pageOptions[selectedPage]),
        bottomNavigationBar: ConvexAppBar(
          color: Colors.white,
          backgroundColor: Colors.blueAccent,
          items: [
            TabItem(icon: Icons.home, title: 'Builder'),
            TabItem(icon: Icons.message, title: 'Selector'),
            TabItem(icon: Icons.calendar_month, title: 'Provider'),
            TabItem(icon: Icons.settings,title: 'MultiProvider'),
            TabItem(icon: Icons.person, title: 'Listener'),
            TabItem(icon: Icons.ac_unit_outlined, title: 'MultiListener'),
          ],
          initialActiveIndex: 0,//optional, default as 0
          onTap: (int i ) async{
            var position = await i;
            setState(() {
              selectedPage = position;
            });
          },
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
  void addHomePage() {
    _pageOptions.add(BlocBuilder());
    _pageOptions.add(BlocSelector());
    _pageOptions.add(BlocProvider());
    _pageOptions.add(MultiBlocProvider());
    _pageOptions.add(BlocListener());
    _pageOptions.add(MultiBlocProvider());
  }
}