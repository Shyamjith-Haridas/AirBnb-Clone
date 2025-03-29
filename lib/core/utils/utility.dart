import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class Utility {
  // Cherry Toast Success
  static void successCherryToast(String message, BuildContext context) {
    CherryToast.success(
      title: Text(message),
      autoDismiss: true,
      toastPosition: Position.top,
      animationType: AnimationType.fromLeft,
    ).show(context);
  }

  // Cherry Toast Error
  static void errorCherryToast(String message, BuildContext context) {
    CherryToast.error(
      title: Text(message),
      autoDismiss: true,
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
    ).show(context);
  }

  // Cherry Toast Info
  static void infoCherryToast(String message, BuildContext context) {
    CherryToast.info(
      title: Text(message),
      autoDismiss: true,
      toastPosition: Position.bottom,
      animationType: AnimationType.fromRight,
    ).show(context);
  }
}
