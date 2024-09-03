import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/templates/material_viewer.dart';

class IntroductionToProofMaterial extends StatelessWidget {
  final String title;
  final String id;
  const IntroductionToProofMaterial(
      {super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialViewer(
        title: title,
        pdfUrl:
            "https://ik.imagekit.io/q1qexvvey/Android%20Studio%20Application%20Development%20(%20PDFDrive%20).pdf?updatedAt=1725256360219", //TODO:  replace with actual material pdf
        onTapFinish: () {
          //TODO: add actual code for this job
          context.pop();
        });
  }
}
