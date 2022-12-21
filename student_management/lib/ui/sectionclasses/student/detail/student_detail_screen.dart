import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/ui/sectionclasses/student/detail/student_detail_provider.dart';

import '../../../../models/student.dart';

class StudentDetailScreenss extends StatelessWidget {
  final Student student;
  final int id;

  const StudentDetailScreenss({Key? key, required this.student, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentDetailProvider>.value(
        value: StudentDetailProvider(id,student.studentId??""),
      child: StudentDetailScreen(),
    );
  }
}

class StudentDetailScreen extends StatefulWidget {

  StudentDetailScreen({Key? key})
      : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  late StudentDetailProvider _studentDetailProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _studentDetailProvider = Provider.of(context);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Detail'),
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
      body: _studentDetailProvider.loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(left: 40, top: 40, right: 40),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _studentDetailProvider.student!["studentName"],
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              _studentDetailProvider.student!["studentCode"],
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                'Grade:',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              _studentDetailProvider.student!['grade'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                'Number Of Break:',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              _studentDetailProvider.student!['numberOfBreaks'].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                'Condition:',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              _studentDetailProvider.student!['condition'].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
