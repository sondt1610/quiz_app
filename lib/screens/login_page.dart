import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/helper/validateHelper.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/screens/register.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthService _authService = AuthService();
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Page"),
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
                    "Login Page",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    initialValue: 'sondt@gmail.com',
                    onSaved: (String value) {
                      email = value;
                    },
                    validator: ValidatorHelper.emailValidator,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    initialValue: '123456',
                    obsecure: true,
                    onSaved: (String value) {
                      password = value;
                    },
                    validator: ValidatorHelper.passwordValidator,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    label: 'Login',
                    width: 200.0,
                    height: 50.0,
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      setState(() {
                        showProgress = true;
                      });
                      try {
                        final userId = await _authService.signIn(email, password);
                        if (userId != null) {
                          print('userId: ' + userId);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Account Info is wrong. Login failed'),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                          ));
                          setState(() {
                            showProgress = false;
                          });
                        }
                      } catch (e) {
                        print('SignIn error 2: ' + e.toString());
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? ',
                          style: TextStyle(color: Colors.black87, fontSize: 17)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Container(
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline,
                                  fontSize: 17)),
                        ),
                      ),
                    ],
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
