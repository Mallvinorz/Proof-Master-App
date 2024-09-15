import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/prior_knowledge_result_view.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class PriorKnowledgeTestReportView extends StatelessWidget {
  final String? studentId;
  const PriorKnowledgeTestReportView({super.key, this.studentId});

  @override
  Widget build(BuildContext context) {
    const type = PriorKnowledgeType.SIX;
    return BackgroundPattern(
      appBarTitle: "Prior Knowledge Report",
      borderRadius: const BorderRadius.only(topRight: Radius.circular(29)),
      mainChildren: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
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
                    PriorKnowledgeType.THREE =>
                      'assets/icons/three_stars_ic.svg',
                    PriorKnowledgeType.FOUR => 'assets/icons/four_stars_ic.svg',
                    PriorKnowledgeType.FIVE => 'assets/icons/five_stars_ic.svg',
                    PriorKnowledgeType.SIX => 'assets/icons/six_stars_ic.svg',
                  }),
                  _newMargin(),
                  Text(
                    switch (type) {
                      // TODO: Handle this case.
                      PriorKnowledgeType.ONE => "Unsupported Response",
                      // TODO: Handle this case.
                      PriorKnowledgeType.TWO => "Surface",
                      // TODO: Handle this case.
                      PriorKnowledgeType.THREE => "Beyond Surface",
                      // TODO: Handle this case.
                      PriorKnowledgeType.FOUR => "Skipping Recognizing",
                      // TODO: Handle this case.
                      PriorKnowledgeType.FIVE => "Beyond Recognizing Element",
                      // TODO: Handle this case.
                      PriorKnowledgeType.SIX => "Beyond Chaining Element",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                  ),
                  _newMargin(),
                  Text(
                    switch (type) {
                      PriorKnowledgeType.ONE =>
                        "Pemahaman Kamu sangat rendah tentang konsep kekongruenan segitiga. Kamu belum mampu menunjukkan pengetahuan dasar atau konsep yang benar.",
                      PriorKnowledgeType.TWO =>
                        "Pemahaman Kamu dangkal tentang konsep kekongruenan segitiga. Kamu telah menunjukkan beberapa pengetahuan dasar tetapi belum memiliki pemahaman yang mendalam.",
                      PriorKnowledgeType.THREE =>
                        "Pemahaman Kamu lebih baik tentang konsep kekongruenan segitiga. Kamu mampu menunjukkan pengetahuan dasar dengan beberapa pemahaman konsep yang lebih mendalam.",
                      PriorKnowledgeType.FOUR =>
                        "Pemahaman Kamu baik tentang konsep kekongruenan segitiga. Kamu menunjukkan kemampuan untuk mengenali elemen-elemen penting tetapi mungkin melewatkan beberapa langkah penting.",
                      PriorKnowledgeType.FIVE =>
                        "Pemahaman Kamu sangat baik tentang konsep kekongruenan segitiga. Kamu mampu mengenali dan memahami sebagian besar elemen penting dengan beberapa pemahaman yang lebih mendalam.",
                      PriorKnowledgeType.SIX =>
                        "Pemahaman Kamu mendalam tentang konsep kekongruenan segitiga. Kamu mampu mengenali, memahami, dan menghubungkan semua elemen penting dengan baik.",
                    },
                    style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }
}
