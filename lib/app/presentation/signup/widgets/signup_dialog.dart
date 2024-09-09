import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/theme/color_theme.dart';

Future<bool?> signupAlertDialog(
    {required BuildContext context,
    required String message,
    required bool isSuccess,
    required Function onClose}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return alertSignupContent(
          context: context,
          message: message,
          onClose: onClose,
          isSuccess: isSuccess);
    },
  );
}

Widget alertSignupContent(
    {required BuildContext context,
    required String message,
    required bool isSuccess,
    required Function onClose}) {
  return AlertDialog(
    title: Text(isSuccess ? 'Registrasi Sukses' : 'Error register!'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          isSuccess
              ? FontAwesomeIcons.circleCheck
              : FontAwesomeIcons.triangleExclamation,
          size: 52,
          color: isSuccess
              ? CustomColorTheme.colorGreenIndicator
              : CustomColorTheme.colorRedIndicator,
        ),
        const SizedBox(height: 16),
        Text(
          message,
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child: Text(isSuccess ? 'Kembali ke halaman login' : 'Tutup'),
        onPressed: () {
          context.pop();
          onClose();
        },
      ),
    ],
  );
}
