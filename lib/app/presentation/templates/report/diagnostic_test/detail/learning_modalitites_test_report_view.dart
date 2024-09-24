import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/utils/diagnostic_test_result_mapper.dart';
import 'package:proofmaster/constanta.dart';
import 'package:proofmaster/theme/text_theme.dart';

class LearningModalititiesReport extends ConsumerWidget {
  final String? studentId;
  const LearningModalititiesReport({
    super.key,
    this.studentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const quizId = 'learning-modalities-test';
    final reportResult = ref
        .watch(diagnosticReportProvider(quizId: quizId, studentId: studentId));
    final isRefresh = ref.watch(isRefreshingDiagnosticProvider);

    return BackgroundPattern(
      appBarTitle: "Learning Modalities Report",
      mainChildren: isRefresh
          ? const Center(child: CircularProgressIndicator())
          : reportResult.when(
              data: (data) => _buildContent(data),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: ErrorHandler(
                  errorMessage:
                      "Error: ${error.toString().contains("record not found") ? "Data report masih belum ada" : error.toString()}",
                  action: () => ref
                      .read(diagnosticReportProvider(
                              quizId: quizId, studentId: studentId)
                          .notifier)
                      .refresh(quizId: quizId, studentId: studentId),
                ),
              ),
            ),
    );
  }

  Widget _buildContent(GetDiagnosticReportResponse report) {
    final type = LearningModalitiesMapper().to(report.data?.type ?? "");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switch (type) {
                    LearningModalitiesType.VISUAL => "Visual",
                    LearningModalitiesType.AUDITORY => "Auditori",
                    LearningModalitiesType.KINESTETIC => "Kinestetik",
                  },
                  style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                ),
                const SizedBox(height: 24),
                SvgPicture.asset(switch (type) {
                  LearningModalitiesType.AUDITORY =>
                    'assets/images/auditory.svg',
                  LearningModalitiesType.KINESTETIC =>
                    'assets/images/kinestestic.svg',
                  LearningModalitiesType.VISUAL => 'assets/images/visual.svg',
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    switch (type) {
                      LearningModalitiesType.VISUAL =>
                        "Kamu memiliki modalitas belajar atau gaya belajar secara visual. Kamu lebih suka informasi yang disajikan dalam bentuk visual seperti grafik, gambar, dan diagram.",
                      LearningModalitiesType.AUDITORY =>
                        "Kamu memiliki modalitas belajar atau gaya belajar secara auditory. Kamu lebih suka belajar melalui mendengarkan, diskusi, dan berbicara tentang informasi.",
                      LearningModalitiesType.KINESTETIC =>
                        "Kamu memiliki modalitas belajar atau gaya belajar secara kinestetik. Kamu lebih suka belajar melalui aktivitas fisik, praktik langsung, dan pengalaman nyata.",
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
