import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;

  CustomButton({
    this.label = 'Button Text',
    this.onPressed,
    this.color = Colors.lightBlue,
    this.width = 200.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        elevation: 5,
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      ),
    );
  }
}
