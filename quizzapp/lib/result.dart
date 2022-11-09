import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  Result(this.resultScore);
  String get resultPhrase{
    var resultText = 'U did it. Your score is ${resultScore}';
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(resultPhrase),
    ) ;
  }
}
