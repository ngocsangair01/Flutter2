import 'package:flutter/material.dart';
class BlocProvider extends StatefulWidget {
  const BlocProvider({Key? key}) : super(key: key);

  @override
  State<BlocProvider> createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('BlocProvider'),
      ),
    );
  }
}
