import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What \'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 15},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 25}
      ],
    },
    {
      'questionText': 'What \'s your favorite animal?',
      'answer': [
        {'text': 'Dog', 'score': 15},
        {'text': 'Cat', 'score': 20},
        {'text': 'Pig', 'score': 25},
        {'text': 'Bird', 'score': 30}
      ],
    },
    {
      'questionText': 'What \'s your favorite game?',
      'answer': [
        {'text': 'Mario', 'score': 20},
        {'text': 'Lol', 'score': 25},
        {'text': 'PUBG', 'score': 30},
        {'text': 'AOV', 'score': 35}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final answers = questions[_questionIndex]['answer'] as List<String>;
    List<Map<String,Object>>? answers ;
    if (_questionIndex < _questions.length) {
      answers = _questions[_questionIndex]['answer'] as List<Map<String,Object>>;
    }
    void _answerQuestion(int score) {
      _totalScore = _totalScore + score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('Have more question');
      } else {
        print('No more question');
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
