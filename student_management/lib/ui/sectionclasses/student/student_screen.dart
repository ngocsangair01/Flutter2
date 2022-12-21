import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/ui/sectionclasses/student/detail/student_detail_provider.dart';
import 'package:student_management/ui/sectionclasses/student/student_provider.dart';
import 'package:student_management/ui/sectionclasses/student/students_list.dart';

class StudentScreen extends StatelessWidget {
  int subjectId;

  StudentScreen(this.subjectId);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentProvider>.value(
      value: StudentProvider(subjectId),
      child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  late StudentProvider _provider;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infor Class'),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage("assets/images/img.png"),
              height: 40,
              width: 40,
            ),
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: _provider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Student',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.calendar_month,size: 35,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  StudentList(_provider),
                ],
              ),
            ),
    );
  }
}
