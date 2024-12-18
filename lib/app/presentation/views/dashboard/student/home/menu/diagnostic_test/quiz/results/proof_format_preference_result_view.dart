import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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

class ProofFormatPreferenceResultView extends ConsumerStatefulWidget {
  final ProofFormatPreferenceType type;
  final String id;
  const ProofFormatPreferenceResultView(
      {super.key, required this.type, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProofFormatPreferenceResultViewState();
}

class _ProofFormatPreferenceResultViewState
    extends ConsumerState<ProofFormatPreferenceResultView> {
  bool _isLoading = false;
  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(13),
        bottomLeft: Radius.circular(13),
      ),
      color: CustomColorTheme.colorBackground2,
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(128, 0, 0, 0),
            blurRadius: 28,
            offset: Offset(0, 4))
      ],
    );

    return Scaffold(
      backgroundColor: CustomColorTheme.colorBackground,
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
                          _buildTitleContent(),
                          _newMargin(),
                          SvgPicture.asset('assets/images/Celebration.svg'),
                          _newMargin(),
                          _buidTextContent()
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                _submitButton()
              ],
            ),
          ),
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
      "Hasil Proof Format Preference Test",
      style: CustomTextTheme.proofMasterTextTheme.displayMedium
          ?.copyWith(color: CustomColorTheme.colorPrimary),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTitleContent() {
    return Text(
      switch (widget.type) {
        ProofFormatPreferenceType.PARAGRAPH => "Preferensi Paragraf Bukti",
        ProofFormatPreferenceType.TWO_COLUMN => "Preferensi Dua-Kolom Bukti",
        ProofFormatPreferenceType.FLOW_CHART => "Preferensi Flow_Chart Bukti",
      },
      style: CustomTextTheme.proofMasterTextTheme.displayMedium,
    );
  }

  Widget _buidTextContent() {
    return Text(
      switch (widget.type) {
        ProofFormatPreferenceType.PARAGRAPH =>
          "Kamu memiliki pemahaman yang baik dalam preferensi paragraf bukti. Kamu lebih suka bukti yang disajikan dalam bentuk paragraf berurutan yang menjelaskan logika bukti secara naratif.",
        ProofFormatPreferenceType.TWO_COLUMN =>
          "Kamu memiliki pemahaman yang baik dalam preferensi dua-kolom bukti. Kamu lebih suka bukti yang disajikan dalam dua kolom terpisah, satu kolom untuk pernyataan dan satu kolom untuk alasan.",
        ProofFormatPreferenceType.FLOW_CHART =>
          "Kamu memiliki pemahaman yang baik dalam preferensi flow-chart bukti. Kamu lebih suka bukti yang disajikan dalam bentuk diagram alir yang menunjukkan langkah-langkah bukti secara visual dan terstruktur.",
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
              final result = ProofFormatPreferenceMapper().from(widget.type);

              final dto = DiagnosticQuizResultDto(result: result);
              await repository.postDiagnosticQuizResult(widget.id, dto);
              await showToast(
                  "Berhasil meyimpan progres quiz anda ke server 🎉");
              // ignore: use_build_context_synchronously
              context.go(ProofmasterRoute.home);
            } catch (e) {
              alertDialog(
                  // ignore: use_build_context_synchronously
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
