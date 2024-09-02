import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/pdf_viewer_online_material.dart';

class ActivityView extends StatelessWidget {
  final String title;
  final String id;
  const ActivityView({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      bottomBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Button(
          suffixIcon: const Icon(
            FontAwesomeIcons.solidFilePdf,
            color: Colors.white,
          ),
          onTap: () async {},
          text: "Unggah Jawaban (Pdf)",
        ),
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      appBarTitle: title,
      mainChildren: PdfViewerOnlineMaterial(
        reachLastPage: (_) {},
        path:
            'https://ik.imagekit.io/q1qexvvey/Android%20Studio%20Application%20Development%20(%20PDFDrive%20).pdf?updatedAt=1725256360219',
      ),
    );
  }
}
