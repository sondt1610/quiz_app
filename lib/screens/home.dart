import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_quiz.dart';
import 'package:quiz_app/screens/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logOut() async {
    await FirebaseAuth.instance.signOut().then((onValue) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: <Widget>[
            // action button
            FlatButton(
              onPressed: () => {logOut()},
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Text('sdgsdgsd'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}
