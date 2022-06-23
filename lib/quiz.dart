import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]["questionText"],
        ),
        ...(questions[questionIndex]["answers"] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
        // O .map vai passar pela minha lista de Strings "answers" e, pra cada String
        // Ele vai criar um Widget "Answer" usando a string da outra lista
        // e no final, retornar uma lista de widgets Answer, em que eu vou tirar cada
        // um dos Widgets e colocar na lista de fora, que é a minha "Column"
        // Assim, eu adiciono os valores de uma lista, em outra lista :o
      ],
    );
  }
}
