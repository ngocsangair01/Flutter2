import 'package:flutter/material.dart';
class MultiBlocListener extends StatefulWidget {
  const MultiBlocListener({Key? key}) : super(key: key);

  @override
  State<MultiBlocListener> createState() => _MultiBlocListenerState();
}

class _MultiBlocListenerState extends State<MultiBlocListener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('MultiBlocListener'),
      ),
    );
  }
}
