import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
          foregroundColor: MaterialStateProperty.all(Colors.blue),
          shadowColor: MaterialStateProperty.all(Colors.black),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
