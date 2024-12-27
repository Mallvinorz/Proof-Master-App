import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/introduction_proof_provider/introduction_proof_provider.dart';
import 'package:proofmaster/app/presentation/templates/material_viewer.dart';

class IntroductionToProofMaterial extends ConsumerWidget {
  final String title;
  final String id;
  final String pdfUrl;
  const IntroductionToProofMaterial(
      {super.key, required this.title, required this.id, required this.pdfUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(introductionProofRepositoryProvider);

    return MaterialViewer(
        title: title,
        pdfUrl: pdfUrl,
        onTapFinish: () async {
          try {
            await provider.finishedReadingMaterial(id);
            // ignore: use_build_context_synchronously
            showToast("Sukses menyimpan progres pembelajaran ke server 🎉");
            context.pop();
          } catch (e) {
            showToast("Error: $e");
          }
        });
  }
}
