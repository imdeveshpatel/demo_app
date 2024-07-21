import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {
  static const String _emailValidatorRegExp =
      r'^[a-zA-Z0-9+_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  static String? isValidateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please type your email.';
    }

    if (RegExp(_emailValidatorRegExp).hasMatch(email)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  //test boolean
  static bool isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    if (RegExp(_emailValidatorRegExp).hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  static String? isValidInput(String? input) {
    if (input == null || input.isEmpty) {
      return 'Required Field';
    } else {
      return null;
    }
  }

  static String? isPasswordValid(
    String? password,
  ) {
    if (password == null || password.isEmpty) {
      return 'Please type your password.';
    }
    return null;
  }

  showToastMessage(
      {required var message,
      Color? backgroundColor,
      gravity = ToastGravity.SNACKBAR}) {
    Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor ?? Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
