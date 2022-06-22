import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
                child: Text("Answer 2"),
                onPressed: () =>
                    print("Answer 2 chosen!") // Anonymous arrow function
                ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: () {
                // Anonymous function
                print("Answer 3 chosen!");
              },
            )
          ],
        ),
      ),
    );
  }
}
