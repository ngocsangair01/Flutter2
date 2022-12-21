import 'package:flutter/material.dart';
class BlocSelector extends StatefulWidget {
  const BlocSelector({Key? key}) : super(key: key);

  @override
  State<BlocSelector> createState() => _BlocSelectorState();
}

class _BlocSelectorState extends State<BlocSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('BlocSelector'),
      ),
    );
  }
}
