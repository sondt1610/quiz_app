import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/screens/create_quiz.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/screens/play_quiz.dart';
import 'package:quiz_app/services/firestore_service.dart';
import 'package:quiz_app/widgets/customButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showProgress = false;
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
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Container(
            child: StreamBuilder(
              stream: Firestore.instance.collection('quiz').snapshots(),
              builder: (context, snapshot) {
                print("snapshots");
                print(snapshot.data);
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.documents[index];
                          return Container(
                            child: Row(
                              children: <Widget>[
                                Text(documentSnapshot["title"]),
                                CustomButton(
                                  label: 'Play Quiz',
                                  width: 100.0,
                                  height: 50.0,
                                  onPressed: () async{
                                    print(documentSnapshot['quizID']);
                                    FirestoreService services = FirestoreService();
                                    List<Question> questions = await services.getQuestionListByQuizDocumentID(documentSnapshot['quizID']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PlayQuiz(questions)),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  default:
                    return Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
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
