import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg, BuildContext context) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      webShowClose: true,
      webPosition: "right",
      webBgColor: "linear-gradient(to right, #33FFD3, #33FFD3)",
      backgroundColor: Theme.of(context).colorScheme.background,
      textColor: const Color.fromARGB(255, 32, 32, 32),
      fontSize: 14.0);
}
