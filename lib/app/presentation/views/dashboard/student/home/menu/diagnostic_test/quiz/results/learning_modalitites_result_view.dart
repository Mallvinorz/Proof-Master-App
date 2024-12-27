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

class LearningModalititesResultView extends ConsumerStatefulWidget {
  final LearningModalitiesType type;
  final String id;
  const LearningModalititesResultView({
    super.key,
    required this.id,
    required this.type,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LearningModalititesResultViewState();
}

class _LearningModalititesResultViewState
    extends ConsumerState<LearningModalititesResultView> {
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
                          SvgPicture.asset('assets/images/visual.svg'),
                          _newMargin(),
                          _buildTextContent()
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
      "Hasil Learning Modalities Test",
      style: CustomTextTheme.proofMasterTextTheme.displayMedium
          ?.copyWith(color: CustomColorTheme.colorPrimary),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTitleContent() {
    return Text(
      switch (widget.type) {
        LearningModalitiesType.VISUAL => "Visual",
        LearningModalitiesType.AUDITORY => "Auditori",
        LearningModalitiesType.KINESTETIC => "Kinestetik",
      },
      style: CustomTextTheme.proofMasterTextTheme.displayMedium,
    );
  }

  Widget _buildTextContent() {
    return Text(
      switch (widget.type) {
        LearningModalitiesType.VISUAL =>
          "Kamu memiliki modalitas belajar atau gaya belajar secara visual. Kamu lebih suka informasi yang disajikan dalam bentuk visual seperti grafik, gambar, dan diagram.",
        LearningModalitiesType.AUDITORY =>
          "Kamu memiliki modalitas belajar atau gaya belajar secara auditory. Kamu lebih suka belajar melalui mendengarkan, diskusi, dan berbicara tentang informasi.",
        LearningModalitiesType.KINESTETIC =>
          "Kamu memiliki modalitas belajar atau gaya belajar secara kinestetik. Kamu lebih suka belajar melalui aktivitas fisik, praktik langsung, dan pengalaman nyata.",
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
              final result = LearningModalitiesMapper().from(widget.type);

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
