import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/widgets/customButton.dart';

class Result extends StatelessWidget {
  final countCorrectAnswers;
  Result(this.countCorrectAnswers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('So cau dung la: $countCorrectAnswers'),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    label: 'Home Page',
                    width: 100.0,
                    height: 50.0,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
