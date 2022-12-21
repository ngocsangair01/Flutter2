import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
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
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Setting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theme Color',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                    border: Border.all(
                        width: 1.0,
                        color: Colors.redAccent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save password',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "OFF",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(65, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Colors.redAccent
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark mode',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "OFF",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(65, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Colors.redAccent
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Timetable Notification',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "OFF",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(65, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Colors.redAccent
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.language, color: Colors.black,),
                  // Image(
                  //   image: AssetImage(""),
                  //   width: 50,
                  //   height: 30,
                  // ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(65, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Colors.redAccent
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
