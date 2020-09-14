import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/widgets/customButton.dart';

class Result extends StatelessWidget {
  final countCorrectAnswers;
  Result(this.countCorrectAnswers);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          iconSize: 65,
                          icon: Image.asset("assets/images/arrow.png"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60),
                          child: Text(
                            "BAZZZ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 50.0,
                                color: blueColor),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        'Your Score : $countCorrectAnswers',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 45.0,
                            color: blueColor),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              label: 'Home Page',
                              width: 200.0,
                              height: 80.0,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
        ],
      ),
    );
  }
}
