import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class QuestionNotifier with ChangeNotifier {
  List<Question> _questionList = [];

  UnmodifiableListView<Question> get questionList => UnmodifiableListView(_questionList);

  set questionList(List<Question> questionList) {
    _questionList = questionList;
    notifyListeners();
  }

  addQuestion(Question question) {
    _questionList.insert(0, question);
    notifyListeners();
  }
}