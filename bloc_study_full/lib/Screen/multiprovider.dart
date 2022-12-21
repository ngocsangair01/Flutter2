import 'package:flutter/material.dart';
class MultiBlocProvider extends StatefulWidget {
  const MultiBlocProvider({Key? key}) : super(key: key);

  @override
  State<MultiBlocProvider> createState() => _MultiBlocProviderState();
}

class _MultiBlocProviderState extends State<MultiBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('MultiBlocProvider'),
      ),
    );
  }
}
