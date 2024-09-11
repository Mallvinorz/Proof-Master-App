import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/activity/widgets/filepicker_pdf.dart';
import 'package:proofmaster/app/presentation/providers/activity_provider/activity_provider.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/alert_dialog.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/pdf_viewer_online_material.dart';

class ActivityView extends ConsumerStatefulWidget {
  final String title;
  final String id;
  const ActivityView({super.key, required this.title, required this.id});

  @override
  ConsumerState<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends ConsumerState<ActivityView> {
  FilePickerResult? _file;

  @override
  Widget build(BuildContext context) {
    final activityStateUpload = ref.watch(activityProvider);

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
                onProgress: activityStateUpload.uploadUiState is UILoading,
                isDisabled: _file == null,
                onTap: () async {
                  try {
                    await ref
                        .read(activityProvider.notifier)
                        .performUploadFile(_file, widget.id);
                    alertDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: 'File jawaban anda berhasil diupload.',
                        title: 'Upload jawaban berhasil!',
                        isSuccess: true,
                        actionWidgets: [
                          TextButton(
                            style: TextButton.styleFrom(
                              // ignore: use_build_context_synchronously
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Kembali ke halaman aktivitas'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ]);
                  } catch (e) {
                    alertDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: "Error: $e",
                        title: "Gagal upload jawaban!",
                        isSuccess: false,
                        actionWidgets: [
                          TextButton(
                            style: TextButton.styleFrom(
                              // ignore: use_build_context_synchronously
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Tutup'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ]);
                  }
                },
                text: "Unggah jawaban",
              ),
            )
          ],
        ),
      ),
    );
  }
}
