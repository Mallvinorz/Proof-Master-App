import 'package:flutter/material.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerOnlineMaterial extends StatelessWidget {
  final String path;
  final Function(bool) reachLastPage;
  const PdfViewerOnlineMaterial(
      {super.key, required this.path, required this.reachLastPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColorTheme.colorBackground,
      child: SfPdfViewer.network(
        enableTextSelection: false,
        canShowScrollHead: false,
        pageSpacing: 0,
        path,
        onPageChanged: (PdfPageChangedDetails details) {
          if (details.isLastPage) reachLastPage(true);
        },
      ),
    );
  }
}
