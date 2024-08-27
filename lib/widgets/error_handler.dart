import 'package:flutter/material.dart';
import 'package:proofmaster/widgets/button.dart';

class ErrorHandler extends StatelessWidget {
  final String errorMessage;
  final Function action;
  const ErrorHandler(
      {super.key, required this.errorMessage, required this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Text(errorMessage), Button(onTap: action, text: "Retry")],
      ),
    );
  }
}
