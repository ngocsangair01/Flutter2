import 'package:flutter/material.dart';
class BlocBuilder extends StatefulWidget {
  const BlocBuilder({Key? key}) : super(key: key);

  @override
  State<BlocBuilder> createState() => _BlocBuilderState();
}

class _BlocBuilderState extends State<BlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('BlocBuilder'),
      ),
    );
  }
}
