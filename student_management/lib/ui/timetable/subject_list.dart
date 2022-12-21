

import 'package:student_management/ui/timetable/subject_detail_screen.dart';

import '../../ui/timetable/subject_provider.dart';
import 'package:flutter/material.dart';
class SubjectList extends StatelessWidget {
  SubjectProvider _subjectProvider;
  SubjectList(this._subjectProvider);

  ListView _buildListView(){
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _subjectProvider.subjects.length,
        itemBuilder:(context,index){
          var subject = _subjectProvider.subjects[index];
          String subjectName = subject.subjectName??"";
          String room = subject.room??"";
          String address = subject.address??"";
          String lesson = subject.lesson??"";
          String timeDetail = subject.timeDetail??"";
          double width = MediaQuery.of(context).size.width;
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
              color: (index) % 2 == 0 ?
              Color.fromRGBO(255, 196, 163, 1) :
              Color.fromRGBO(255, 194, 190, 1),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: InkWell(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(subjectName,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(lesson),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(room),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(address),
                      Text(timeDetail),
                    ],
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectDetailScreen(subject: subject)));
              },
            ),
          );
        }
    );
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
