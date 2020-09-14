import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;
  final double fontSize;

  CustomButton({
    this.label = 'Button Text',
    this.onPressed,
    this.color = Colors.lightBlue,
    this.width = 280.0,
    this.height = 60.0,
    this.fontSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 350,
        height: 100,
        child: Stack(
          children: [
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Positioned(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: [thirdColor, secondColor],
                  ),
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
