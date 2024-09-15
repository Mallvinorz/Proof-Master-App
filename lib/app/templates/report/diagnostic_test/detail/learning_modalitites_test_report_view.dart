import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/learning_modalitites_result_view.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/text_theme.dart';

class LearningModalititiesReport extends StatelessWidget {
  final String? studentId;
  const LearningModalititiesReport({
    super.key,
    this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    final type = LearningModalitiesType.VISUAL;
    return BackgroundPattern(
      appBarTitle: "Learning Modalities Report",
      mainChildren: Column(
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
      ),
    );
  }
}
