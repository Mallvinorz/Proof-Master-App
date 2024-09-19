import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/diagnostic_quiz_result_dto/diagnosticquizresultdto.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/utils/diagnostic_test_result_mapper.dart';
import 'package:proofmaster/constanta.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class PriorKnowledgeResultView extends ConsumerStatefulWidget {
  final PriorKnowledgeType type;
  final String id;
  const PriorKnowledgeResultView({
    super.key,
    required this.type,
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PriorKnowledgeResultViewState();
}

class _PriorKnowledgeResultViewState
    extends ConsumerState<PriorKnowledgeResultView> {
  bool _isLoading = false;
  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const decoration = BoxDecoration(
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
        ]);

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
                      decoration: decoration,
                      child: Column(
                        children: [
                          _buildTitleScreen(),
                          _newMargin(),
                          SvgPicture.asset(switch (widget.type) {
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
                          _buildTitleResult(),
                          _newMargin(),
                          _buildTextContent()
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                _submitButton()
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

  Widget _buildTitleScreen() {
    return Text(
      "Hasil Prior Knowledge Test",
      style: CustomTextTheme.proofMasterTextTheme.displayMedium
          ?.copyWith(color: CustomColorTheme.colorPrimary),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTitleResult() {
    return Text(
      switch (widget.type) {
        PriorKnowledgeType.ONE => "Unsupported Response",
        PriorKnowledgeType.TWO => "Surface",
        PriorKnowledgeType.THREE => "Beyond Surface",
        PriorKnowledgeType.FOUR => "Skipping Recognizing",
        PriorKnowledgeType.FIVE => "Beyond Recognizing Element",
        PriorKnowledgeType.SIX => "Beyond Chaining Element",
      },
      style: CustomTextTheme.proofMasterTextTheme.displayMedium,
    );
  }

  Widget _buildTextContent() {
    return Text(
      switch (widget.type) {
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
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: Button(
          isDisabled: _isLoading,
          onProgress: _isLoading,
          onTap: () async {
            try {
              setLoading(true);
              final repository = ref.read(quizRepositoryProvider);
              final result = PriorKnowledgeMapper().from(widget.type);

              final dto = DiagnosticQuizResultDto(result: result);
              await repository.postDiagnosticQuizResult(widget.id, dto);
              await showToast(
                  "Berhasil meyimpan progres quiz anda ke server 🎉");
              context.go(ProofmasterRoute.home);
            } catch (e) {
              alertDialog(
                  context: context,
                  message:
                      "Gagal menyimpan progress quiz anda ke server, klik 'Kembali ke dashboard' untuk kembali ke halaman utama, akan tetapi progress anda tidak akan tersimpan. Klik 'Tutup' lalu klik 'Simpan, dan kembali' untuk mencoba menyimpan ulang progres anda ke server.",
                  title: "Gagal menyimpan progress quiz anda!",
                  isSuccess: false,
                  actionWidgets: [
                    TextButton(
                        onPressed: () {
                          context.go(ProofmasterRoute.home);
                        },
                        child: const Text("Kembali ke dashboard")),
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Tutup"))
                  ]);
            } finally {
              setLoading(false);
            }
          },
          text: "Simpan, dan kembali"),
    );
  }
}
