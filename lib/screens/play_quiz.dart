import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/widgets/one_question.dart';
import 'package:quiz_app/widgets/result.dart';

class PlayQuiz extends StatefulWidget {
  final List<Question> questions;
  PlayQuiz(this.questions);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  var itemIndex = 0;
  var countCorrectAnswers = 0;

  Function getNextQuestion(correctAnswer){
    print('correctAnswer');
    print(correctAnswer);
    print(widget.questions.length);
    if(correctAnswer == widget.questions[itemIndex].correctOption){
      setState(() {
        countCorrectAnswers = countCorrectAnswers + 1;
      });
    }
    if(itemIndex + 1 == widget.questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Result(countCorrectAnswers)),
      );
    } else {
      setState(() {
        itemIndex = itemIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    //[0].question
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Quiz"),
      ),
      body: Column(
        children: <Widget>[
          Text('fsdsd'),
          OneQuestion(widget.questions[itemIndex], getNextQuestion)
        ],
      ),
    );
  }
}
