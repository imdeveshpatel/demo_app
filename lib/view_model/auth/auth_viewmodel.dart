import 'package:demo_app/view_model/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthViewModel extends BaseViewModel {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  void signup() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailCon.text,
        password: passCon.text,
      );
    } catch (ex) {
      print(ex);
    }
  }

  void signin() async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: emailCon.text,
            password: passCon.text,
          )
          .whenComplete(() => Text("login done"));
    } catch (ex) {
      print(ex);
    }
  }
}
