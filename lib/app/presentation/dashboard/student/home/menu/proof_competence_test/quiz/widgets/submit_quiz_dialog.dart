import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showSubmitQuizDialog(
    {required BuildContext context, required Function onSubmit}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apakah anda yakin menyelesaikan quiz ini?'),
        content: const Text(
          "Dengan mengklik tombol 'Ya, saya yakin' jawaban anda akan disimpan, dan nilai quizmu akan muncul.'",
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
              onSubmit();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
