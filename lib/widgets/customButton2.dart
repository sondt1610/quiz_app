import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';

class CustomButton2 extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;
  final double fontSize;

  CustomButton2({
    this.label = 'Button Text',
    this.onPressed,
    this.color = Colors.lightBlue,
    this.width = 190.0,
    this.height = 120.0,
    this.fontSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 4, top: 12, bottom: 12),
      child: Container(
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.white),
                  gradient: LinearGradient(
                    colors: [thirdColor, secondColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ]),
              child: FlatButton(
                color: Colors.white.withOpacity(0),
                onPressed: onPressed,
                child: Text(label,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: fontSize,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
