import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/templates/material_viewer.dart';

class IntroductionToProofMaterial extends StatelessWidget {
  final String title;
  final String id;
  final String pdfUrl;
  const IntroductionToProofMaterial(
      {super.key, required this.title, required this.id, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialViewer(
        title: title,
        pdfUrl: pdfUrl,
        onTapFinish: () {
          //TODO: add actual code for this job
          context.pop();
        });
  }
}
