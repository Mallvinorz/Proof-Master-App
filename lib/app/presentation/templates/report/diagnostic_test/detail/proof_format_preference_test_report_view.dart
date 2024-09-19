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

class ProofFormatPreferenceTestReportView extends ConsumerWidget {
  final String? studentId;
  const ProofFormatPreferenceTestReportView({super.key, this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const quizId = 'proof-format-preference-test';
    final reportResult = ref
        .watch(diagnosticReportProvider(quizId: quizId, studentId: studentId));
    final isRefresh = ref.watch(isRefreshingDiagnosticProvider);

    return BackgroundPattern(
      appBarTitle: "Proof Format Preference Report",
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      mainChildren: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: isRefresh
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : reportResult.when(
                  data: (data) => _buildContent(data),
                  error: (error, _) => Center(
                        child: ErrorHandler(
                            errorMessage: "Error: $error",
                            action: () => ref
                                .read(diagnosticReportProvider(
                                        quizId: quizId, studentId: studentId)
                                    .notifier)
                                .refresh(quizId: quizId, studentId: studentId)),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))),
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _buildContent(GetDiagnosticReportResponse result) {
    final type = ProofFormatPreferenceMapper().to(result.data?.type ?? "");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: CustomColorTheme.colorBackground2,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(13),
              bottomLeft: Radius.circular(13),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(125, 0, 0, 0),
                blurRadius: 28,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                switch (type) {
                  ProofFormatPreferenceType.PARAGRAPH =>
                    "Preferensi Paragraf Bukti",
                  ProofFormatPreferenceType.TWO_COLUMN =>
                    "Preferensi Dua-Kolom Bukti",
                  ProofFormatPreferenceType.FLOW_CHART =>
                    "Preferensi Flow-Chart Bukti",
                },
                style: CustomTextTheme.proofMasterTextTheme.displayMedium,
              ),
              _newMargin(),
              SvgPicture.asset('assets/images/Celebration.svg'),
              _newMargin(),
              Text(
                switch (type) {
                  ProofFormatPreferenceType.PARAGRAPH =>
                    "Kamu memiliki pemahaman yang baik dalam preferensi paragraf bukti. Kamu lebih suka bukti yang disajikan dalam bentuk paragraf berurutan yang menjelaskan logika bukti secara naratif.",
                  ProofFormatPreferenceType.TWO_COLUMN =>
                    "Kamu memiliki pemahaman yang baik dalam preferensi dua-kolom bukti. Kamu lebih suka bukti yang disajikan dalam dua kolom terpisah, satu kolom untuk pernyataan dan satu kolom untuk alasan.",
                  ProofFormatPreferenceType.FLOW_CHART =>
                    "Kamu memiliki pemahaman yang baik dalam preferensi flow-chart bukti. Kamu lebih suka bukti yang disajikan dalam bentuk diagram alir yang menunjukkan langkah-langkah bukti secara visual dan terstruktur.",
                },
                style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
              )
            ],
          ),
        ),
      ],
    );
  }
}
