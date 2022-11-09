import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:minismart/main.dart';
import 'package:minismart/ui/home/home.dart';
import 'package:minismart/util/contants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _pushToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("${imageLink}logo.png"),
          const SizedBox(height: 40,),
          LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,size: 50)
        ],
      ),
    );
  }

  _pushToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Home()));
  }
}
