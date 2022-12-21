import 'package:flutter/material.dart';
import 'package:student_management/models/message.dart';
import 'package:student_management/ui/message/message_screen.dart';

class MessageItem extends StatelessWidget {
  Message message;

  MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MessageScreen.routeName,
            arguments: {'message': message});
      },
      child: Container(
          margin: EdgeInsets.only(left: 40, bottom: 20, right: 40),
          height: 50,
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
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        this.message.name.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        this.message.idClass.toString(),
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
          )),
    );
  }
}
