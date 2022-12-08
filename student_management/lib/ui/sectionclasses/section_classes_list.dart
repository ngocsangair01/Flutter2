import 'package:flutter/material.dart';
import 'package:student_management/ui/sectionclasses/section_element.dart';

class SectionClassesList extends StatelessWidget {
  const SectionClassesList({Key? key}) : super(key: key);

  SingleChildScrollView _buildListView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height:45,),
          Container(
            alignment: Alignment.center,
            child: Text('Section Classes',style: TextStyle(fontSize: 25),),
          ),
          const SizedBox(height: 20,),
          SectionElement(),
          SectionElement(),
          SectionElement(),
          SectionElement(),
          SectionElement(),
          SectionElement(),
          SectionElement(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: _buildListView(),
    );
  }
}
