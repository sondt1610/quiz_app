import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/helper/validateHelper.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/firestore_service.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

import '../home.dart';

class QuestionFragment extends StatefulWidget {
  final setStage;
  final addQuestion;
  final getQuiz;
  QuestionFragment(
      {Key key,
      @required this.setStage,
      @required this.addQuestion,
      @required this.getQuiz})
      : super(key: key);
  @override
  _QuestionFragment createState() => _QuestionFragment(
      setStage: setStage, addQuestion: addQuestion, getQuiz: getQuiz);
}

class _QuestionFragment extends State<QuestionFragment> {
  final Function setStage;
  final Function addQuestion;
  final Function getQuiz;
  String question, option1, option2, option3, option4;
  String correctAnswer;
  TextEditingController questionController = new TextEditingController();
  TextEditingController option1Controller = new TextEditingController();
  TextEditingController option2Controller = new TextEditingController();
  TextEditingController option3Controller = new TextEditingController();
  TextEditingController option4Controller = new TextEditingController();

  final List<String> _locations = ['Option1', 'Option2', 'Option3', 'Option4'];
  _QuestionFragment(
      {Key key,
      @required this.setStage,
      @required this.addQuestion,
      @required this.getQuiz});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future addQuizToFireStore() async {
    Quiz quiz = getQuiz();
    print(quiz.toJson());
    await FirestoreService()
        .addQuiz(quiz)
        .then((value) => print('Add Quiz Success'));
  }

  bool showProgress = false;
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showProgress,
      child: Center(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Question Create",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 10.0),
              ),
              CustomTextField(
                  hintText: "Question",
                  controller: questionController,
                  onSaved: (String value) {
                    question = value;
                  },
                  validator: ValidatorHelper.stringValidator),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                hintText: "Option1",
                controller: option1Controller,
                onSaved: (String value) {
                  option1 = value;
                },
                validator: ValidatorHelper.stringValidator,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                hintText: "Option2",
                controller: option2Controller,
                onSaved: (String value) {
                  option2 = value;
                },
                validator: ValidatorHelper.stringValidator,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                hintText: "Option3",
                controller: option3Controller,
                onSaved: (String value) {
                  option3 = value;
                },
                validator: ValidatorHelper.stringValidator,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                hintText: "Option4",
                controller: option4Controller,
                onSaved: (String value) {
                  option4 = value;
                },
                validator: ValidatorHelper.stringValidator,
              ),
              SizedBox(
                height: 10.0,
              ),
              DropdownButton(
                hint: Text(
                    'Please choose correct answer'), // Not necessary for Option 1
                value: correctAnswer,
                onChanged: (newValue) {
                  setState(() {
                    correctAnswer = newValue;
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              CustomButton(
                  label: 'Back',
                  onPressed: () async {
                    setStage(1);
                  }),
              CustomButton(
                  label: 'Next Question',
                  onPressed: () async {
                    _formKey.currentState.save();
                    addQuestion(new Question(question, option1, option2,
                        option3, option4, correctAnswer));
                    setState(() {
                      correctAnswer = 'Option1';
                    });
                    questionController.clear();
                    option1Controller.clear();
                    option2Controller.clear();
                    option3Controller.clear();
                    option4Controller.clear();
                  }),
              CustomButton(
                  label: 'Finish',
                  onPressed: () async {
                    _formKey.currentState.save();
                    addQuestion(new Question(question, option1, option2,
                        option3, option4, correctAnswer));
                    setState(() {
                      showProgress = true;
                    });
                    addQuizToFireStore().then((value) {
                      setState(() {
                        showProgress = false;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });
                  }),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
