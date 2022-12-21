import 'package:flutter/material.dart';
import 'package:student_management/ui/message/fake_data.dart';
import 'package:student_management/ui/message/message_item.dart';

class MessageScreen extends StatelessWidget {
  static const String routeName = '/MessageScreen';

  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
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
      body: Container(
        width: double.infinity,
        height: 500,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Message',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children:
                  fake_message.map((e) => MessageItem(message: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
