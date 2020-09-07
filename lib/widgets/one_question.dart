import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/customButton.dart';

class OneQuestion extends StatelessWidget {
  final Question question;
  final Function getNextQuestion;

  OneQuestion(this.question, this.getNextQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(question.question),
        CustomButton(
          label: question.option1,
          width: 100.0,
          height: 50.0,
          onPressed: () {
            print('option1');
            getNextQuestion('Option1');
          },
        ),
        CustomButton(
          label: question.option2,
          width: 100.0,
          height: 50.0,
          onPressed: () {
            print('option2');
            getNextQuestion('Option2');
          },
        ),
        CustomButton(
          label: question.option3,
          width: 100.0,
          height: 50.0,
          onPressed: () {
            print('option3');
            getNextQuestion('Option3');
          },
        ),
        CustomButton(
          label: question.option4,
          width: 100.0,
          height: 50.0,
          onPressed: () {
            print('option4');
            getNextQuestion('Option4');
          },
        ),
      ],
    );
  }
}
