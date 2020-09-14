import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/helper/hexcolor.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/play_quiz.dart';
import 'package:quiz_app/services/firestore_service.dart';

import 'customButton.dart';

class QuizyCard extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  QuizyCard({
    this.documentSnapshot,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.9,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  documentSnapshot["title"],
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 34,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 200,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: CustomButton(
                    label: 'Play',
                    fontSize: 28,
                    width: 130.0,
                    height: 50.0,
                    onPressed: () async {
                      print(documentSnapshot['quizID']);
                      FirestoreService services = FirestoreService();
                      List<Question> questions =
                          await services.getQuestionListByQuizDocumentID(
                              documentSnapshot['quizID']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayQuiz(questions)),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
