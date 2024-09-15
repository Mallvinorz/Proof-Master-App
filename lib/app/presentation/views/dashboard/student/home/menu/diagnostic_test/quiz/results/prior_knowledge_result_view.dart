import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';

class PriorKnowledgeResultView extends StatelessWidget {
  final PriorKnowledgeType type;
  const PriorKnowledgeResultView({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/img_bg.png')),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Column(
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
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            "Hasil Prior Knowledge Test",
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium
                                ?.copyWith(
                                    color: CustomColorTheme.colorPrimary),
                            textAlign: TextAlign.center,
                          ),
                          _newMargin(),
                          SvgPicture.asset(switch (type) {
                            PriorKnowledgeType.ONE =>
                              'assets/icons/one_star_ic.svg',
                            PriorKnowledgeType.TWO =>
                              'assets/icons/two_stars_ic.svg',
                            PriorKnowledgeType.THREE =>
                              'assets/icons/three_stars_ic.svg',
                            PriorKnowledgeType.FOUR =>
                              'assets/icons/four_stars_ic.svg',
                            PriorKnowledgeType.FIVE =>
                              'assets/icons/five_stars_ic.svg',
                            PriorKnowledgeType.SIX =>
                              'assets/icons/six_stars_ic.svg',
                          }),
                          _newMargin(),
                          Text(
                            switch (type) {
                              PriorKnowledgeType.ONE => "Unsupported Response",
                              PriorKnowledgeType.TWO => "Surface",
                              PriorKnowledgeType.THREE => "Beyond Surface",
                              PriorKnowledgeType.FOUR => "Skipping Recognizing",
                              PriorKnowledgeType.FIVE =>
                                "Beyond Recognizing Element",
                              PriorKnowledgeType.SIX =>
                                "Beyond Chaining Element",
                            },
                            style: CustomTextTheme
                                .proofMasterTextTheme.displayMedium,
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
                            style:
                                CustomTextTheme.proofMasterTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                      onTap: () {
                        context.go(ProofmasterRoute.home);
                      },
                      text: "Kembali"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _newMargin() {
    return const SizedBox(
      height: 20,
    );
  }
}

enum PriorKnowledgeType { ONE, TWO, THREE, FOUR, FIVE, SIX }
