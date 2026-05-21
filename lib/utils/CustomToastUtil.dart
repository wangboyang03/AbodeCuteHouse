import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PromptAction {
  // 吐司提示
  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 210, 207, 207));
  }

  // showSuccess
  static showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 85, 238, 164));
  }

  // showWarning
  static showWarning(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.yellowAccent);
  }

  // showError
  static showError(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent);
  }
}