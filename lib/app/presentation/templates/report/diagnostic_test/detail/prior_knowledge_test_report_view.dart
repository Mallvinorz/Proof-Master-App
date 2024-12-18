import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/data/responses/general/get_diagnostic_report/get_diagnostic_report_response/get_diagnostic_report_response.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/utils/diagnostic_test_result_mapper.dart';
import 'package:proofmaster/constanta.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class PriorKnowledgeTestReportView extends ConsumerWidget {
  final String? studentId;
  const PriorKnowledgeTestReportView({super.key, this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const quizId = 'prior-knowledge-test';
    final reportResult = ref
        .watch(diagnosticReportProvider(quizId: quizId, studentId: studentId));
    final isRefresh = ref.watch(isRefreshingDiagnosticProvider);
    final screenHeight = MediaQuery.of(context).size.height;

    return BackgroundPattern(
      appBarTitle: "Prior Knowledge Report",
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      mainChildren: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: isRefresh
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : reportResult.when(
                data: (data) => _buildContent(data),
                error: (error, _) => Padding(
                  padding: EdgeInsets.only(top: screenHeight / 2 - 100),
                  child: Center(
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
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }

  Widget _buildContent(GetDiagnosticReportResponse report) {
    final type = PriorKnowledgeMapper().to(report.data?.type ?? "");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: const BoxDecoration(
              color: CustomColorTheme.colorBackground2,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(125, 0, 0, 0),
                  blurRadius: 28,
                  offset: Offset(0, 4),
                )
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(switch (type) {
                PriorKnowledgeType.ONE => 'assets/icons/one_star_ic.svg',
                PriorKnowledgeType.TWO => 'assets/icons/two_stars_ic.svg',
                PriorKnowledgeType.THREE => 'assets/icons/three_stars_ic.svg',
                PriorKnowledgeType.FOUR => 'assets/icons/four_stars_ic.svg',
              }),
              _newMargin(),
              Text(
                switch (type) {
                  PriorKnowledgeType.ONE => "Needs Improvement",
                  PriorKnowledgeType.TWO => "Sufficient",
                  PriorKnowledgeType.THREE => "Good",
                  PriorKnowledgeType.FOUR => "Excelent",
                },
                style: CustomTextTheme.proofMasterTextTheme.displayMedium,
              ),
              _newMargin(),
              Text(
                switch (type) {
                  PriorKnowledgeType.ONE =>
                    "Pemahaman sangat terbatas terhadap bukti, membutuhkan pembelajaran intensif untuk semua dimensi.",
                  PriorKnowledgeType.TWO =>
                    "Pemahaman terbatas pada beberapa dimensi, memerlukan peningkatan signifikan pada dimensi lainnya.",
                  PriorKnowledgeType.THREE =>
                    "Pemahaman baik dengan sedikit area yang memerlukan peningkatan.",
                  PriorKnowledgeType.FOUR =>
                    "Pemahaman menyeluruh dan mendalam terhadap bukti, mencangkup semua aspek penilaian.",
                },
                style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
              )
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }
}
