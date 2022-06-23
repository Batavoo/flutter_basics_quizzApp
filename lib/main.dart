import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';

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
  var _questionIndex = 0;
  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Black", "Red", "Green", "Yellow"]
    },
    {
      "questionText": "What's your favorite animal",
      "answers": ["Dog", "Cat", "Lion", "Turtle"]
    },
    {
      "questionText": "What's your favorite pneu?",
      "answers": ["Bia", "Bia", "Bia", "Bia"]
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length) {
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
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIndex]["questionText"],
                  ),
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                  // O .map vai passar pela minha lista de Strings "answers" e, pra cada String
                  // Ele vai criar um Widget "Answer" usando a string da outra lista
                  // e no final, retornar uma lista de widgets Answer, em que eu vou tirar cada
                  // um dos Widgets e colocar na lista de fora, que é a minha "Column"
                  // Assim, eu adiciono os valores de uma lista, em outra lista :o
                ],
              )
            : Center(
                child: Text("YOU DID IT!!!"),
              ),
      ),
    );
  }
}
