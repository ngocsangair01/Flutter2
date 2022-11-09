import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String? _email;
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    print('init state');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    WidgetsBinding.instance.removeObserver(this);
    emailEditingController.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in background');
    } else if (state == AppLifecycleState.resumed) {
      print('App is resumed');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('run build');
    return MaterialApp(
      title: 'Hello, day la Sang',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'This is text:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red),
              ),
              Text(
                '${_email}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)),
                      ),
                      labelText: 'Enter name'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
