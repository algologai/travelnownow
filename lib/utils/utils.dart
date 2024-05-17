import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastmessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(
      String title, String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          titleColor: Colors.amberAccent,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeInOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          message: message,
          backgroundColor: Colors.red,
          title: title,
          messageColor: Colors.white,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static void flushBarSuccessMessage(
      String title, String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          titleColor: Colors.black,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeInOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          message: message,
          backgroundColor: Colors.lightGreen,
          title: title,
          messageColor: Colors.black,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
