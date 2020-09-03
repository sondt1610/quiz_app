import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String title, desc, imageURL;
  bool showProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Quiz"),
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              autovalidate: true,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Create",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: "Title",
                    onSaved: (String value) {
                      title = value;
                    },
                    validator: null,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                      hintText: "Desc",
                      obsecure: true,
                      onSaved: (String value) {
                        desc = value;
                      },
                      validator: null),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                      hintText: "imgURL",
                      obsecure: true,
                      onSaved: (String value) {
                        desc = value;
                      },
                      validator: null),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                      label: 'Next',
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        setState(() {
                          showProgress = true;
                        });
                        try {} catch (e) {
                          print('SignUp error 2: ' + e.toString());
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
