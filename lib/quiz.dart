import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(int) answer;

  Quiz({
    @required this.questions, 
    @required this.questionIndex, 
    @required this.answer
  });

  bool get hasQuestion {
    return questionIndex < questions.length;
  }
  
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestion ? questions[questionIndex]['answers'] : null;

    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['text']),
        ...answers.map((ans) => Answer(ans['text'], () => answer(ans['points']))).toList()
      ],
    );
  }
}