import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/screens/create_quiz.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/screens/play_quiz.dart';
import 'package:quiz_app/services/firestore_service.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';
import 'package:quiz_app/widgets/quizy_card.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Stack(
            children: [
              Positioned(
                top: -50,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: blueColor,
                      image: DecorationImage(
                          image: AssetImage("assets/images/homepage.jpg"),
                          alignment: Alignment.centerLeft)),
                ),
              ),
              Positioned(
                  top: 300,
                  child: Container(
                    width: size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: grayColor,
                    ),
                  )),
              Positioned(
                top: 50,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 140),
                  child: Text(
                    "BAZZZ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 50.0,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "Cảm Hứng Bay Xa",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 39.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                  top: 180,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: size.width * 0.9,
                    height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 35.0,
                                color: blueColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Let us know what you want to try !!",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 20.0,
                                color: blueColor),
                          ),
                        ),
                        Container(
                          width: size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: CustomTextField(
                              hintText: "Type keyword here...",
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                  )),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 380.0),
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
                                  return QuizyCard(
                                      documentSnapshot: documentSnapshot);
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
              Positioned(
                top: 20,
                right: 0,
                child: Container(
                  child: FlatButton(
                    onPressed: () => {logOut()},
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
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
