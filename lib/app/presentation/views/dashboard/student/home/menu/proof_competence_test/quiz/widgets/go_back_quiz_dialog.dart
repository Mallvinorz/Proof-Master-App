import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> goBackQuizDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apakah anda yakin ingin keluar quiz?'),
        content: const Text(
          'Saat ini anda sedang mengerjakan quiz, keluar dari quiz yang sedang berlangsung akan membuat progres anda hilang',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ya, saya yakin'),
            onPressed: () {
              Navigator.of(context).pop();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
