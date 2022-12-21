import 'package:flutter/material.dart';
import 'package:student_management/ui/sectionclasses/student/detail/student_detail_screen.dart';
import 'package:student_management/ui/sectionclasses/student/student_provider.dart';

class StudentList extends StatelessWidget {
  StudentProvider _studentProvider;

  StudentList(this._studentProvider);

  ListView _buildListView() {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _studentProvider.students.length,
        itemBuilder: (context, index) {
          var student = _studentProvider.students[index];
          return Container(
              margin: EdgeInsets.only(left: 40, bottom: 20, right: 40),
              height: 60,
              child: InkWell(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.people,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              student.fullName ?? "",
                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Text(
                              student.studentOfClass ?? "",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                        child: Divider(
                          color: Colors.black54,
                        )),
                  ],
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StudentDetailScreenss(student: student,id: _studentProvider.subjectId,)));
                },
              ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: [
          _buildListView(),
        ],
      ),
    );
  }
}
