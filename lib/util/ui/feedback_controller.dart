import 'package:swypex/res/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

SnackBar createSnackBar(String message) {
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Text(message));
}

void showSnackBarWithContext(SnackBar snackBar, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void hideSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}

void showToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ConstColors.toastBackground,
      textColor: ConstColors.toastText,
      fontSize: 16.0);
}

/// references
/// https://pub.dev/packages/fluttertoast
/// https://www.youtube.com/watch?v=UkudAgCEhBI
/// https://www.youtube.com/watch?v=_jRnmwno668
