import 'package:flutter/cupertino.dart';
import 'package:quiz_app/helper/validateHelper.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

class QuizFragment extends StatefulWidget {
  final setStage;
  final setQuiz;
  QuizFragment({Key key, @required this.setStage, @required this.setQuiz})
      : super(key: key);
  @override
  _QuizFragment createState() =>
      _QuizFragment(setStage: setStage, setQuiz: setQuiz);
}

class _QuizFragment extends State<QuizFragment> {
  final Function setStage;
  final Function setQuiz;
  String title, desc, imageURL;
  _QuizFragment({Key key, @required this.setStage, @required this.setQuiz});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Create",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              hintText: "Title",
              onSaved: (String value) {
                title = value;
              },
              validator: ValidatorHelper.stringValidator,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(
                hintText: "Desc",
                onSaved: (String value) {
                  desc = value;
                },
                validator: ValidatorHelper.stringValidator),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(
                hintText: "imgURL",
                onSaved: (String value) {
                  imageURL = value;
                },
                validator: ValidatorHelper.stringValidator),
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
                  _formKey.currentState.save();
                  setStage(2);
                  setQuiz(title, desc, imageURL);
                }),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
