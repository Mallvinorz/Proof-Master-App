import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';

Future<bool?> alertDialog({
  required BuildContext context,
  required String message,
  required String title,
  required bool isSuccess,
  required List<Widget> actionWidgets,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return alertSignupContent(
        context: context,
        message: message,
        title: title,
        actionWidgets: actionWidgets,
        isSuccess: isSuccess,
      );
    },
  );
}

Widget alertSignupContent({
  required BuildContext context,
  required String message,
  required String title,
  required bool isSuccess,
  required List<Widget> actionWidgets,
}) {
  return AlertDialog(
    title: Text(title),
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
    actions: actionWidgets,
  );
}
