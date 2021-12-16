// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
//void main() {
//runApp(MyApp());
//}

void main() => (runApp(MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ToDo:implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': "What is the capital of Indonesia ?",
      'answers': [
        {'text': 'Manila', 'score': 0},
        {'text': 'Bali', 'score': 0},
        {'text': 'Jakarta', 'score': 5},
        {'text': 'karabi', 'score': 0}
      ]
    },
    {
      'questionText':
          "Which charcter in the famous T.V Show Friends had the dialogue,How you Doing ?",
      'answers': [
        {'text': 'Ross', 'score': 0},
        {'text': 'Phoebe', 'score': 0},
        {'text': 'Chandler', 'score': 0},
        {'text': 'Joey', 'score': 5}
      ]
    },
    {
      'questionText': "Who among the following has 7 world titles in F1 ?",
      'answers': [
        {'text': 'Hamilton', 'score': 5},
        {'text': 'Vettel', 'score': 0},
        {'text': 'James Hunt', 'score': 0},
        {'text': 'Nikki Lauda', 'score': 0}
      ]
    },
    {
      'questionText':
          "In a recent event,Netflix CEO described X as Netflix's biggest competitor.What is X?",
      'answers': [
        {'text': 'BlockBuster', 'score': 0},
        {'text': 'Sleep', 'score': 5},
        {'text': 'Cost', 'score': 0},
        {'text': 'Theaters', 'score': 0}
      ]
    },
    {
      'questionText': "Who designed the car Volkswagon Bettle?",
      'answers': [
        {'text': 'Adolf Hitler', 'score': 5},
        {'text': 'George Bush', 'score': 0},
        {'text': 'Leonardo DiCaprio', 'score': 0},
        {'text': 'Rajiv Gandhi', 'score': 0}
      ]
    },
  ];
  var _questionIndex = 0;
  var total_score = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      total_score = 0;
    });
  }

  void _answerQuestion(int score) {
    total_score = total_score + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions !");
    } else {
      print('No more Questions');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My first flutter"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(total_score, _resetQuiz)),
    );
  }
}
