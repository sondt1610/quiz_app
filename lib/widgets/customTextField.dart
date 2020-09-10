import 'package:flutter/material.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/helper/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final Function onSaved;
  final bool obsecure;
  final Function validator;
  final TextEditingController controller;

  CustomTextField(
      {this.hintText,
      this.initialValue = '',
      this.onSaved,
      this.obsecure = false,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          // Icon(Icons.email, color: primaryColor),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    width: size.width * 0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 20.0, color: blueColor.withOpacity(0.7)),
                      ),
                      obscureText: obsecure,
                      // initialValue: initialValue,
                      controller: controller,
                      style: TextStyle(
                          fontSize: 20,
                          color: blueColor,
                          fontFamily: 'Source Sans Pro'),
                      cursorColor: Colors.black,
                      validator: validator,
                      onSaved: onSaved,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 6,
                  child: Container(
                    width: size.width * 0.9,
                    height: 4,
                    child: Text('Hello'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue[300].withOpacity(0.7),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // child: TextFormField(
      //   textAlign: TextAlign.center,
      //   decoration: InputDecoration(
      //     hintText: hintText,
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(32.0),
      //       ),
      //     ),
      //   ),
      //   obscureText: obsecure,
      //   // initialValue: initialValue,
      //   controller: controller,
      //   style: TextStyle(fontSize: 20, color: Colors.black),
      //   cursorColor: Colors.black,
      //   validator: validator,
      //   onSaved: onSaved,
      // ),
    );
  }
}
