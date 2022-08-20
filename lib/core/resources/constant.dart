import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static void alertDialogAndroid(context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Alert'),
              content: const Text('This is an alert dialog.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )));
  }

  static void alertDialogIos(context) {
    showDialog(
        context: context,
        builder: ((context) => CupertinoAlertDialog(
              title: const Text('Alert'),
              content: const Text('This is an alert dialog.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )));
  }
}
