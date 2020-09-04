import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/firestore_service.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

import 'fragments/question_fragment.dart';
import 'fragments/quiz_fragment.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String title, desc, imageURL;
  List<Question> listQuestion = new List<Question>();
  Function switchFunc = (stage, setStage, setQuiz, addQuestion, getQuiz) {
    switch (stage) {
      case 1:
        return new QuizFragment(setStage: setStage, setQuiz: setQuiz);
        break;
      case 2:
        return new QuestionFragment(
            setStage: setStage, addQuestion: addQuestion, getQuiz: getQuiz);
        break;
    }
  };
  int stage = 1;
  setStage(value) => {
        setState(() {
          stage = value;
        })
      };
  setQuiz(titlee, descc, imageURLl) {
    setState(() {
      title = titlee;
      desc = descc;
      imageURL = imageURLl;
    });
    print(title);
  }

  addQuestion(Question question) {
    listQuestion.add(question);
  }

  Quiz getQuiz() {
    Quiz quiz = new Quiz(imageURL, title, desc);
    quiz.questionList = listQuestion;
    return quiz;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Quiz"),
      ),
      body: switchFunc(stage, setStage, setQuiz, addQuestion, getQuiz),
    );
  }
}
