import 'package:flutter/material.dart';

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
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
        ),
        obscureText: obsecure,
        // initialValue: initialValue,
        controller: controller,
        style: TextStyle(fontSize: 20, color: Colors.black),
        cursorColor: Colors.black,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
