import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/templates/quiz_template.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/go_back_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/submit_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/router.dart';

class ProofCompetenceQuiz extends ConsumerStatefulWidget {
  final String title;
  final String id;
  const ProofCompetenceQuiz({super.key, required this.title, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProofCompetenceQuiz();
}

class _ProofCompetenceQuiz extends ConsumerState<ProofCompetenceQuiz> {
  QuizRepository? quizRepository;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizRepository = ref.watch(quizRepositoryProvider);

      ref
          .read(getDiagnosticQuizQuestionsFromProvider(widget.id).future)
          .then((response) {
        if (response.questions.isNotEmpty) {
          ref.read(quizProvider.notifier).initQuiz(response.questions,
              response.prerequisiteImg, response.prerequisiteDesc);
        }
      });
    });
  }

  @override
  void dispose() {
    quizRepository = null;
    super.dispose();
  }

  Future<void> handleSubmitToServer(double score) async {
    try {
      final repository = ref.read(quizRepositoryProvider);
      await repository.postProofCompetenceResult(widget.id, score.round());
      await showToast("Berhasil meyimpan progres quiz anda ke server 🎉");
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizUiState = ref.watch(quizProvider);
    final quizQuestionsAsyncValue =
        ref.watch(getDiagnosticQuizQuestionsFromProvider(widget.id));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final shouldPop = await goBackQuizDialog(context);
        if (shouldPop == true) {
          if (context.mounted) {
            context.pop();
          }
        }
      },
      child: BackgroundPattern(
        onTapNavBack: () async {
          await goBackQuizDialog(context);
        },
        usePatternBg: false,
        appBarTitle: widget.title,
        mainChildren: quizQuestionsAsyncValue.when(
          data: (quizes) => quizUiState.questions.isEmpty
              ? const Text("Data quiz masih kosong")
              : QuizTemplate(
                  title: widget.title,
                  quizState: quizUiState,
                  moveQuizIndex: (int index) =>
                      ref.read(quizProvider.notifier).goToQuestion(index),
                  goToNextQuestion: () =>
                      ref.read(quizProvider.notifier).goToNextQuestion(),
                  goToPrevQuestion: () =>
                      ref.read(quizProvider.notifier).goToPreviousQuestion(),
                  onSelectQuizAnswer: (int value, int index) => ref
                      .read(quizProvider.notifier)
                      .updateSelectedAnswer(value, index),
                  toggleMarkSelectedQuestion: (int index) => ref
                      .read(quizProvider.notifier)
                      .toggleMarkedQuestion(index),
                  toggleQuizNavigation: () =>
                      ref.read(quizProvider.notifier).toggleQuizNavigation(),
                  onSubmitQuiz: () async => {
                    showSubmitQuizDialog(
                      context: context,
                      onSubmit: () async {
                        try {
                          ref
                              .read(quizProvider.notifier)
                              .checkAllQuestionsIsAnswered();
                          final score = ref
                              .read(quizProvider.notifier)
                              .calculateQuizScore();

                          await handleSubmitToServer(score);

                          context.replaceNamed(ProofmasterRoute.score,
                              pathParameters: {"score": score.toString()});
                        } catch (e) {
                          alertDialog(
                              context: context,
                              message: "$e",
                              title:
                                  e.toString().contains("masih belum dijawab")
                                      ? "Beberapa soal masih belum dijawab!"
                                      : "Gagal submit quiz ke server!",
                              isSuccess: false,
                              actionWidgets: [
                                TextButton(
                                  onPressed: () => context.pop(),
                                  child: const Text("Tutup"),
                                )
                              ]);
                        }
                      },
                    )
                  },
                ),
          error: (error, _) => Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ErrorHandler(
                errorMessage: "Quiz masih belum tersedia.",
                action: () => ref
                    .refresh(getDiagnosticQuizQuestionsFromProvider(widget.id)),
              )),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
