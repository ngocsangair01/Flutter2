import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList({required this.transactions});

  ListView _buildWidgetList() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: index % 2 == 0 ? Colors.blue : Colors.pink,
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.access_alarm),
              title: Text('${transactions[index].email}'),
              subtitle: Text('${transactions[index].password}'),
              onTap: () {
                print('tap me');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // dung listview để tạo thanh cuộn
    return Container(
      height: 500,
      child: _buildWidgetList(),
    );
  }
}
