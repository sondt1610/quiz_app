import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_app/helper/validateHelper.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/widgets/customButton.dart';
import 'package:quiz_app/widgets/customTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AuthService _authService = new AuthService();
  bool showProgress = false;

  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Register Page"),
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
                    "Registration",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: "Email",
//                    initialValue: 'sondt@gmail.com',
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
//                    initialValue: '123456',
                    obsecure: true,
                    controller: _passwordController,
                    onSaved: (String value) {
                      password = value;
                    },
                    validator: ValidatorHelper.passwordValidator,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    hintText: " Confirm Password",
//                    initialValue: '123456',
                    obsecure: true,
                    validator: (String value) {
//                      if (_passwordController.text != value) {
//                        return 'Passwords do not match';
//                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                      label: 'Register',
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        setState(() {
                          showProgress = true;
                        });
                        try {
                          final userId = await _authService.signUp(email, password);
                          if (userId != null) {
                            Fluttertoast.showToast(
                                msg: "Register Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                            setState(() {
                              showProgress = false;
                            });
                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Register failed'),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              showProgress = false;
                            });
                          }
                        } catch (e) {
                          print('SignUp error 2: ' + e.toString());
                        }
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Registered? ",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 17)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Container(
                          child: Text('Login Now',
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
