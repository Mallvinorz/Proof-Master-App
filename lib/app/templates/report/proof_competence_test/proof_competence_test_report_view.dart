import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/text_theme.dart';

class ProofCompetenceTestReportView extends StatelessWidget {
  final String? studentId;
  const ProofCompetenceTestReportView({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Proof Competence Test Report",
      borderRadius: const BorderRadius.only(topRight: Radius.circular(36)),
      mainChildren: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
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
                      colors: [Color(0xFFE2E5FF), Color(0xFFFFFFFF)],
                    ),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: _buildCardContent()),
            ),
            const SizedBox(height: 24),
            studentId == null || studentId!.isEmpty
                ? Text(
                    "Lebih giat belajar lagi ya",
                    textAlign: TextAlign.center,
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/learning_again.svg',
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
          "100",
          style: CustomTextTheme.proofMasterTextTheme.displayMedium
              ?.copyWith(fontSize: 32),
        ),
      ],
    );
  }
}
