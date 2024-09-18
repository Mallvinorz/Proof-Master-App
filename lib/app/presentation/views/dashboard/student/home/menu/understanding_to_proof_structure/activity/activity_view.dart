import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/domain/entities/post_understanding_proof_answer_dto/postunderstandingproofanswedto.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/understanding_to_proof_structure/activity/widgets/filepicker_pdf.dart';
import 'package:proofmaster/app/presentation/providers/activity_provider/activity_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/pdf_viewer_online_material.dart';

class ActivityView extends ConsumerStatefulWidget {
  final String title;
  final String id;
  const ActivityView({super.key, required this.title, required this.id});

  @override
  ConsumerState<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends ConsumerState<ActivityView> {
  PlatformFile? _file;

  @override
  Widget build(BuildContext context) {
    final activityStateUpload = ref.watch(activityProvider);
    final selectedActivity =
        ref.watch(proofUnderstadingActivityProvider(widget.id));

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
              "Soal ${widget.id}",
              style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            selectedActivity.when(
                data: (data) => _buildContent(
                    pdfUrl: data.data?.pdfUrl ?? "-", height: fullHeight / 2),
                error: (error, _) => ErrorHandler(
                    errorMessage: "$error",
                    action: () async {
                      await ref
                          .read(proofUnderstadingActivityProvider(widget.id)
                              .notifier)
                          .refresh(widget.id);
                    }),
                loading: () => ShimmerLoader(
                    isLoading: true,
                    child: _buildContent(pdfUrl: "", height: fullHeight / 2))),
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
                isDisabled: selectedActivity is UISuccess && _file == null,
                onTap: () async {
                  try {
                    if (_file?.path == null) {
                      throw Exception("File path is invalid! Filepath is null");
                    }

                    final pdfFile = File(_file!.path!);

                    final PostUnderstandingProofAnsweDto dto =
                        PostUnderstandingProofAnsweDto(
                      pdfFile: pdfFile,
                      activityId: widget.id,
                    );
                    await ref
                        .read(activityProvider.notifier)
                        .performUploadFile(dto);
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

// ignore: camel_case_types
class _buildContent extends StatelessWidget {
  final String pdfUrl;
  final double height;
  const _buildContent({required this.pdfUrl, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32))),
      height: height,
      child: PdfViewerOnlineMaterial(
        reachLastPage: (_) {},
        path: pdfUrl,
      ),
    );
  }
}
