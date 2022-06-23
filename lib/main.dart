import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 1},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 8},
        {"text": "Yellow", "score": 3},
      ]
    },
    {
      "questionText": "What's your favorite animal",
      "answers": [
        {"text": "Dog", "score": 3},
        {"text": "Cat", "score": 1},
        {"text": "Lion", "score": 6},
        {"text": "Turtle", "score": 10},
      ]
    },
    {
      "questionText": "What's your favorite pneu?",
      "answers": [
        {"text": "Bia", "score": 1},
        {"text": "Bia", "score": 1},
        {"text": "Bia", "score": 1},
        {"text": "Bia", "score": 1},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("we have more questions!");
    } else {
      print("no more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                answerQuestion: _answerQuestion,
              )
            : Result(),
      ),
    );
  }
}
