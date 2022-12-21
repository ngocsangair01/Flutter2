import 'package:flutter/material.dart';
import 'package:student_management/ui/sign_in/sign_in_screen.dart';

class UserInforScreen extends StatefulWidget {
  UserInforScreen({Key? key}) : super(key: key);

  @override
  State<UserInforScreen> createState() => _UserInforScreenState();
}

class _UserInforScreenState extends State<UserInforScreen> {
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
      body: Container(
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
                        "Admin",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "1",
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
                          'Admin:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "admin",
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
                          'Infor:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "",
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
                        "",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            SignInScreen()), (Route<dynamic> route) => false);
                      },
                      child: Text("Log Out")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
