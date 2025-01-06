import 'package:flutter/material.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/pdf_viewer_online_material.dart';

class MaterialViewer extends StatefulWidget {
  final String title;
  final String pdfUrl;
  final Function onTapFinish;
  const MaterialViewer(
      {super.key,
      required this.title,
      required this.pdfUrl,
      required this.onTapFinish});

  @override
  State<MaterialViewer> createState() => _MaterialViewerState();
}

class _MaterialViewerState extends State<MaterialViewer> {
  bool _reachLastPage = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      appBarTitle: widget.title,
      mainChildren: Stack(
        children: [
          PdfViewerOnlineMaterial(
            reachLastPage: (value) => setState(() {
              _reachLastPage = value;
            }),
            path: widget.pdfUrl,
          ),
          Positioned(
              bottom: 8,
              right: 16,
              child: Button(
                onTap: () async {
                  _reachLastPage
                      ? widget.onTapFinish()
                      : await showToast(
                          "Selesaikan membaca sampai halaman terakhir terlebih dahulu!",
                        );
                },
                text: "Selesai",
                isOutlined: !_reachLastPage,
              ))
        ],
      ),
    );
  }
}
