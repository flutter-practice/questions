import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(new QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _questionIndex = 0;
  var _totalPoints = 0;
  final List<Map<String, Object>> _questions = [
    {
      'text': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'points': 10},
        {'text': 'Red', 'points': 7},
        {'text': 'Green', 'points': 3},
        {'text': 'White', 'points': 8}
      ]
    },
    {
      'text': 'What is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'points': 9},
        {'text': 'Cat', 'points': 3},
        {'text': 'Snake', 'points': 4},
        {'text': 'Lyon', 'points': 10}
      ]
    },
    {
      'text': 'Random question?',
      'answers': [
        {'text': 'Whatever', 'points': 10},
        {'text': 'Whenever', 'points': 3},
        {'text': 'Whoever', 'points': 2},
        {'text': 'However', 'points': 1},
      ]
    }
  ];

  void _answer(int point) {
    if (hasQuestion) {
      setState(() {
        _questionIndex++;
        _totalPoints += point;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalPoints = 0;
    });
  }

  bool get hasQuestion {
    return _questionIndex < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Questions'),
            ),
            body: hasQuestion
                ? Quiz(
                    questions: _questions,
                    questionIndex: _questionIndex,
                    answer: _answer)
                : Result(_totalPoints, _resetQuiz)));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
