import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ProofCompetenceTestReportView extends ConsumerWidget {
  final String? studentId;
  const ProofCompetenceTestReportView({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportResult = ref.watch(proofCompetenceReportProvider(
        quizId: "reading-comprehension-test", studentId: studentId));
    final isRefresh = ref.watch(isRefreshingProvider);

    return BackgroundPattern(
      appBarTitle: "Proof Competence Test Report",
      borderRadius: const BorderRadius.only(topRight: Radius.circular(36)),
      mainChildren: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: isRefresh
              ? const SizedBox(
                  width: 48, height: 48, child: CircularProgressIndicator())
              : reportResult.when(
                  data: (data) => Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            elevation: 20, // Change this
                            shadowColor: const Color.fromARGB(255, 0, 0, 0),
                            child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFE2E5FF),
                                      Color(0xFFFFFFFF)
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(32),
                                child:
                                    _buildCardContent(data.data?.score ?? 0)),
                          ),
                          const SizedBox(height: 24),
                          studentId == null || studentId!.isEmpty
                              ? Text(
                                  (data.data?.score ?? 0) <= 75
                                      ? "Lebih giat belajar lagi ya"
                                      : "Tetap pertahankan!",
                                  textAlign: TextAlign.center,
                                  style: CustomTextTheme
                                      .proofMasterTextTheme.displayMedium,
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                  error: (_, error) => ErrorHandler(
                        errorMessage: "Error: $error",
                        action: () => ref.read(proofCompetenceReportProvider(
                                quizId: "reading-comprehension-test",
                                studentId: studentId)
                            .notifier),
                      ),
                  loading: () => const SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator()))),
    );
  }

  Widget _buildCardContent(int score) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          score > 75
              ? 'assets/images/success.svg'
              : 'assets/images/learning_again.svg',
          width: 240,
          height: 125,
        ),
        Text(
          studentId == null || studentId!.isEmpty
              ? "Nilai testmu"
              : "Nilai siswa",
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
        ),
        Text(
          score.toString(),
          style: CustomTextTheme.proofMasterTextTheme.displayMedium
              ?.copyWith(fontSize: 32),
        ),
      ],
    );
  }
}
