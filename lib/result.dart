import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final points;
  final void Function() onResetQuiz;

  Result(this.points, this.onResetQuiz);

  String get result {
    if (points < 8)
      return 'Congratulations';
    else if (points < 12)
      return "You're good!";
    else if (points < 16)
      return 'Impressive';
    else
      return 'Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          result,
          style: TextStyle(fontSize: 28),
        )),
        FlatButton(
          onPressed: onResetQuiz, 
          textColor: Colors.blue,
          child: Text('Reset?', 
            style: TextStyle(fontSize: 18)
          ))
      ],
    );
  }
}
