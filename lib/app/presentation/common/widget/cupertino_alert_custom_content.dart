import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCupertinoAlertWithCustomContent(
    {required BuildContext context,
    required String contentText,
    required String title,
    required Function onOk}) {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(contentText),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Batal'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
            onOk();
          },
          child: const Text('Ya'),
        ),
      ],
    ),
  );
}
