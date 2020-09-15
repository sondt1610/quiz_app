import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/models/question.dart';

import 'customButton2.dart';

class OneQuestion extends StatelessWidget {
  final Question question;
  final Function getNextQuestion;

  OneQuestion(this.question, this.getNextQuestion);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: -50,
          child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: grayColor,
              )),
        ),
        Positioned(
          top: -50,
          child: Container(
              width: size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ])),
        ),
        Positioned(
            child: IconButton(
          iconSize: 65,
          icon: Image.asset("assets/images/arrow.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        Positioned(
          top: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 150),
            child: Text(
              "BAZZZ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 50.0,
                  color: blueColor),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 150),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    question.question,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 40.0,
                        color: blueColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  child: Row(
                    children: [
                      CustomButton2(
                        label: question.option1,
                        onPressed: () {
                          print('option1');
                          getNextQuestion('Option1');
                        },
                      ),
                      CustomButton2(
                        label: question.option2,
                        onPressed: () {
                          print('option2');
                          getNextQuestion('Option2');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomButton2(
                      label: question.option3,
                      onPressed: () {
                        print('option3');
                        getNextQuestion('Option3');
                      },
                    ),
                    CustomButton2(
                      label: question.option4,
                      onPressed: () {
                        print('option4');
                        getNextQuestion('Option4');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
