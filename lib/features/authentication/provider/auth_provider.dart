import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn {
    return _firebaseAuth.currentUser != null;
  }

  Future<UserCredential> handleSignInEmail(
      String email, String password) async {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> handSignUpEmail(String email, String password) {
    final result = _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return result;
  }
}
