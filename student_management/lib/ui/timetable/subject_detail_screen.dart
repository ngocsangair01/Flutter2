import 'package:flutter/material.dart';
import 'package:student_management/models/subjects.dart';
import 'package:student_management/models/timetable_details.dart';


class SubjectDetailScreen extends StatelessWidget {
  final Subject subject;

  const SubjectDetailScreen({Key? key, required this.subject})
      : super(key: key);

  ListView _buildListView() {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var timetableDetail = subject.timeTableDetails?[index];
        int? week = timetableDetail?.week as int;
        String? from = timetableDetail?.from as String;
        String? timeDetail = timetableDetail?.timeDetail as String;
        return Container(
          height: 88,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0,1.5),
                blurRadius: 3,
                spreadRadius: 0.5,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.red,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$week',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text(lesson),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(from),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(timeDetail),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: subject.timeTableDetails?.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    List timeTableDetail = subject.timeTableDetails as List;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết'),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(subject.subjectName ?? "",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            _buildListView(),
          ],
        ),
      ),
    );
  }
}
