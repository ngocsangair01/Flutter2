import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:student_management/ui/message/message_screen.dart';
import 'package:student_management/ui/sectionclasses/sectionclassesscreen.dart';
import 'package:student_management/ui/setting/setting_screen.dart';
import 'package:student_management/ui/timetable/subject_screen.dart';
import 'package:student_management/ui/user_infor/user_infor_screen.dart';

class MyHomePagee extends StatefulWidget {
  MyHomePagee({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {

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

    return Scaffold(
      body: Builder(builder: (context) => _pageOptions[selectedPage],),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: Colors.redAccent,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.calendar_month, title: 'Calendar'),
          TabItem(icon: Icons.settings,title: 'Setting'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i ) async{
          var position = await i;
          setState(() {
            selectedPage = position;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void addHomePage() {
    _pageOptions.add(SectionScreen());
    _pageOptions.add(MessageScreen());
    _pageOptions.add(SubjectScreen());
    _pageOptions.add(SettingScreen());
    _pageOptions.add(UserInforScreen());
  }
}