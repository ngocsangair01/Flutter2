import 'package:flutter/material.dart';
import 'infor.dart';

class InforList extends StatelessWidget {
  List<Infor> infors;


  InforList({required this.infors});

  ListView _inforList() {
    return ListView.builder(
        itemCount: infors.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.blue,
            elevation: 10,
            child: ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('${infors.elementAt(index).name}'),
              subtitle: Text('${infors.elementAt(index).id}'),
              onTap: () {
                print('get infor');
              },
              onLongPress: () {
                print('long press');
                Infor();
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500,
      child: _inforList(),
    );
  }
}
