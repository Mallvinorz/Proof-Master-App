import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/data/responses/teacher/get_answered_activity_from_student_response/get_answered_activity_from_student_response.dart';
import 'package:proofmaster/app/domain/entities/activity_review_dto/activityreviewdto.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/activity_provider/activity_provider.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';
import 'package:proofmaster/app/presentation/widgets/textarea.dart';
import 'package:proofmaster/app/utils/download_path.dart';
import 'package:proofmaster/app/utils/permission.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class DetailActivityReportContent extends ConsumerStatefulWidget {
  final String? activityId;
  final String? studentId;
  final String title;
  const DetailActivityReportContent(
      {super.key, required this.title, this.activityId, this.studentId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailActivityReportContentState();
}

class _DetailActivityReportContentState
    extends ConsumerState<DetailActivityReportContent> {
  bool _isLoadingPostReview = false;
  void setPostReviewLoading(bool value) {
    setState(() {
      _isLoadingPostReview = value;
    });
  }

  Future<bool> performDownloadPdfFile(String url) async {
    if (await requestStoragePermission()) {
      String? downloadPath = await getAndroidDownloadDirectory();

      if (downloadPath == null) return false;
      String? taskId;
      try {
        taskId = await FlutterDownloader.enqueue(
          url: url, //TODO: replace with actual download materials links
          headers: {}, // optional: header send with url (auth token etc)
          savedDir: downloadPath,
          saveInPublicStorage: true,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        Fimber.d("download task: $taskId");
      } catch (e) {
        Fimber.d("download task: $e");
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final activities = ref.watch(
        proofUnderstadingAnsweredDetailActivityProvider(widget.activityId!));
    final isRefreshing = ref.watch(isRefreshingAnsweredDetailProvider);

    return isRefreshing
        ? _buildLoader()
        : activities.when(
            data: (data) => _buildContent(data),
            error: (error, _) => SingleChildScrollView(
              child: ErrorHandler(
                  errorMessage: "Error: $error",
                  action: () => ref
                      .read(proofUnderstadingAnsweredDetailActivityProvider(
                              widget.activityId!)
                          .notifier)
                      .refresh(widget.activityId!)),
            ),
            loading: () => _buildLoader(),
          );
  }

  Widget _buildContent(GetAnsweredActivityFromStudentResponse data) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            color: CustomColorTheme.colorBackground2,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/icons/Paper.png",
                // fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: double.infinity,
            child: Button(
              onTap: () async {
                try {
                  if (Platform.isIOS) {
                    context.pushNamed(ProofmasterRoute.studentAnswerPdfViewer,
                        queryParameters: {
                          "title": widget.title,
                          "pdfUrl": data.data?.pdfUrl ?? "",
                        });
                  } else if (Platform.isAndroid) {
                    await performDownloadPdfFile(data.data?.pdfUrl ?? "-");
                  } else {
                    throw Exception("Platform is not supported yet!");
                  }
                } catch (e) {
                  showToast("Download error: $e");
                }
              },
              text:
                  "${Platform.isIOS ? "Lihat file" : "Unduh file"} ${widget.studentId == null || widget.studentId == "" ? 'jawabanmu' : 'jawaban siswa'}",
              suffixIcon: const Icon(
                FontAwesomeIcons.solidFilePdf,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Commentar(
            isLoadingPost: _isLoadingPostReview,
            initialValue: data.data?.comment ?? "",
            readOnly: widget.studentId == "",
            onPostReview: (comment) async {
              FocusManager.instance.primaryFocus?.unfocus();
              if (widget.studentId == null) return;
              try {
                setPostReviewLoading(true);
                final dto = ActivityReviewDto(
                    activityId: widget.activityId!, comment: comment);
                await ref
                    .read(activityRepositoryProvider)
                    .postReviewActivity(dto);

                alertDialog(
                    context: context,
                    message: "Review jawaban anda telah disimpan ke server!",
                    title: "Berhasil mengunggah review jawaban!",
                    isSuccess: true,
                    actionWidgets: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                            context.pop();
                          },
                          child: const Text("Tutup"))
                    ]);
              } catch (e) {
                alertDialog(
                    context: context,
                    message: "Error: $e",
                    title: "Gagal mengunggah review jawaban!",
                    isSuccess: false,
                    actionWidgets: [
                      TextButton(
                          onPressed: () => context.pop(),
                          child: const Text("Tutup"))
                    ]);
              } finally {
                setPostReviewLoading(false);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        ShimmerLoader(
          isLoading: true,
          child: Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            color: CustomColorTheme.colorBackground2,
            child: Container(
              padding: const EdgeInsets.all(40.0),
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/icons/Paper.png",
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          width: double.infinity,
          child: ShimmerLoader(
            isLoading: true,
            child: Button(
              onTap: () {},
              text:
                  "Unduh file ${widget.activityId == null || widget.activityId == "" ? 'jawabanmu' : 'jawaban siswa'}",
              suffixIcon: const Icon(
                FontAwesomeIcons.solidFilePdf,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ShimmerLoader(
          isLoading: true,
          child: Commentar(
              isLoadingPost: false,
              onPostReview: (_) {},
              initialValue: "",
              readOnly: widget.activityId == ""),
        )
      ],
    );
  }
}

class Commentar extends StatelessWidget {
  final bool readOnly;
  final String initialValue;
  final Function(String value) onPostReview;
  final bool isLoadingPost;
  const Commentar({
    super.key,
    required this.readOnly,
    required this.initialValue,
    required this.isLoadingPost,
    required this.onPostReview,
  });
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);
    return readOnly
        ? SizedBox(
            height: 100,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Review Jawabanmu:",
                        style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                            ?.copyWith(color: Colors.grey)),
                    Text(
                      initialValue.isEmpty ? "Belum ada review" : initialValue,
                      style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Komentar: $initialValue",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                      ?.copyWith(color: Colors.grey)),
              TextArea(
                controller: controller,
                label: 'Review Jawaban',
                placeholder: 'Masukkan review anda',
              ),
              SizedBox(
                  width: double.infinity,
                  child: Button(
                      isDisabled: isLoadingPost,
                      onProgress: isLoadingPost,
                      onTap: () {
                        onPostReview(controller.text);
                      },
                      text: "Simpan review jawaban"))
            ],
          );
  }
}
