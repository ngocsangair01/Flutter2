import 'package:flutter/material.dart';
class BlocListener extends StatefulWidget {
  const BlocListener({Key? key}) : super(key: key);

  @override
  State<BlocListener> createState() => _BlocListenerState();
}

class _BlocListenerState extends State<BlocListener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('BlocListener'),
      ),
    );
  }
}
