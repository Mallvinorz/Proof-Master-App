import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showLogoutDialog(
    {required BuildContext context, required Function onSubmit}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apakah anda yakin keluar dari akun ini?'),
        content: const Text(
          "Setelah keluar, anda perlu memasukkan email dan password lagi untuk bisa masuk ke akun ini.",
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
