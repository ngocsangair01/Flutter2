import 'package:flutter/material.dart';
import 'package:student_management/ui/sectionclasses/session_provider.dart';
import 'package:student_management/ui/sectionclasses/student/student_screen.dart';

class SectionClassesList extends StatelessWidget {
  SessionProvider _sectionProvider;

  SectionClassesList(this._sectionProvider);

  ListView _buildListView() {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _sectionProvider.sectionClasses.length,
      itemBuilder: (context, index) {
        var section = _sectionProvider.sectionClasses[index];
        int? subjectId = section.id;
        return Container(
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1.5),
                blurRadius: 3,
                spreadRadius: 0.5,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: (index) % 2 == 0 ?
            Color.fromRGBO(255, 196, 163, 1) :
            Color.fromRGBO(255, 194, 190, 1),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Lesson',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(section.numberOfUnit??""),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 60,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        section.name??"",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(section.name??""),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StudentScreen(subjectId!)));
            },
          ),
        );
      },
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
