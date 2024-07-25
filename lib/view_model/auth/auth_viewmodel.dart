import 'package:demo_app/view_model/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthViewModel extends BaseViewModel {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  Future<bool> signup() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCon.text,
        password: passCon.text,
      );
      if (userCredential.user?.uid != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (ex) {
      print(ex);
      // toast
      return false;
    }
  }

  Future<bool> signin({required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailCon.text,
        password: passCon.text,
      );

      if (userCredential.user?.uid != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (ex) {
      print(ex);
      // toast
      return false;
    }
  }
}
