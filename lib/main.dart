import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/helper/constaint.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: backgroundColor
      ),
      home: RegisterPage(),
    );
  }
}
