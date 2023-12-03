import 'package:flutter/material.dart';

Future showTextDialog(
  BuildContext context,
  String message, {
  bool barrierDismissible = true,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
