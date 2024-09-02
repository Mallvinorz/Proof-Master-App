import 'package:flutter/material.dart';
import 'package:proofmaster/app/templates/quiz_template.dart';

class DiagnosticTestQuiz extends StatelessWidget {
  final String title;
  final String id;
  const DiagnosticTestQuiz({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return QuizTemplate(title: title);
  }
}
