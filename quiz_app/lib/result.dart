import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resText;
    if (resultScore <= 5)
      resText = "Better Luck Next time";
    else if (resultScore == 10)
      resText = "So close , yet so far, Try Again!";
    else if (resultScore == 15)
      resText = "Great work, can still improve";
    else
      resText = "Congratulations on attempting the quiz with flying colours !";
    return resText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      FlatButton(
        onPressed: resetHandler,
        child: Text("RESTART QUIZ"),
        textColor: Colors.blue,
      )
    ]));
  }
}
