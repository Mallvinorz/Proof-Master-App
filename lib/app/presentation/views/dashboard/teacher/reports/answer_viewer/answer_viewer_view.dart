import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/introduction_proof_provider/introduction_proof_provider.dart';
import 'package:proofmaster/app/presentation/templates/material_viewer.dart';

class AnswerViewerView extends ConsumerWidget {
  final String title;
  final String pdfUrl;
  const AnswerViewerView(
      {super.key, required this.title, required this.pdfUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialViewer(
      title: title,
      pdfUrl: pdfUrl,
      onTapFinish: () async {
        try {
          context.pop();
        } catch (e) {
          showToast("Error: $e");
        }
      },
    );
  }
}
