
import 'package:flutter/material.dart';
class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Display'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: descriptionController,
              ),
              ElevatedButton(
                onPressed: (){

                },
                child: Text('Hello lan 2'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
