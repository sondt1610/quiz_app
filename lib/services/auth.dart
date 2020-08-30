import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? user.uid : null;
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print('SignIn error 1: ' + e.toString());
    }
  }

  Future signUp(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('SignUp error 1: ' + e.toString());
      return null;
    }
  }
}
