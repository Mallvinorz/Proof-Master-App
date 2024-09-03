import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/activity/widgets/filepicker_pdf.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/pdf_viewer_online_material.dart';

class ActivityView extends StatefulWidget {
  final String title;
  final String id;
  const ActivityView({super.key, required this.title, required this.id});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  FilePickerResult? _file;

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    return BackgroundPattern(
      usePatternBg: false,
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      appBarTitle: widget.title,
      mainChildren: Container(
        padding: const EdgeInsets.only(top: 8),
        height: fullHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soal",
              style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              height: fullHeight / 2,
              child: PdfViewerOnlineMaterial(
                reachLastPage: (_) {},
                path:
                    'https://ik.imagekit.io/q1qexvvey/Android%20Studio%20Application%20Development%20(%20PDFDrive%20).pdf?updatedAt=1725256360219',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                "Jawaban",
                style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
            ),
            FilePickerPdf(
              onPickFile: (file) {
                setState(() {
                  _file = file;
                });
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Button(
                isDisabled: _file == null,
                onTap: () {},
                text: "Unggah jawaban",
              ),
            )
          ],
        ),
      ),
    );
  }
}
