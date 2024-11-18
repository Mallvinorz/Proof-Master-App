import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/templates/quiz_template.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/go_back_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/submit_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/constanta.dart';
import 'package:proofmaster/router.dart';

class DiagnosticTestQuiz extends ConsumerStatefulWidget {
  final String title;
  final String id;
  const DiagnosticTestQuiz({super.key, required this.title, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiagnosticTestQuizState();
}

class _DiagnosticTestQuizState extends ConsumerState<DiagnosticTestQuiz> {
  QuizRepository? quizRepository;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizRepository = ref.watch(quizRepositoryProvider);

      ref
          .read(getDiagnosticQuizQuestionsFromProvider(widget.id).future)
          .then((response) {
        if (response.isNotEmpty) {
          ref.read(quizProvider.notifier).initQuiz(response);
        }
      });
    });
  }

  @override
  void dispose() {
    quizRepository = null;
    super.dispose();
  }

  void performSubmitQuiz() {
    ref.read(quizProvider.notifier).checkAllQuestionsIsAnswered();
    switch (widget.id) {
      case DiagnosticTestRoute.priorKnowledge:
        final score =
            ref.read(quizProvider.notifier).calculateQuizScorePriorKnowledge();
        final selectedResult = switch (score) {
          > 0 && <= 5 => PriorKnowledgeType.ONE,
          > 5 && <= 8 => PriorKnowledgeType.TWO,
          > 9 && <= 11 => PriorKnowledgeType.THREE,
          > 11 && <= 14 => PriorKnowledgeType.FOUR,
          _ => PriorKnowledgeType.ONE,
        };
        context.replaceNamed(ProofmasterRoute.priorKnowledgeQuiz,
            pathParameters: {
              "id": widget.id,
              "type": selectedResult.toString()
            });
        break;
      case DiagnosticTestRoute.learningModalities:
        final score =
            ref.read(quizProvider.notifier).getMajorityAnswersOption();
        final selectedResult = switch (score) {
          0 => LearningModalitiesType.VISUAL,
          1 => LearningModalitiesType.AUDITORY,
          2 => LearningModalitiesType.KINESTETIC,
          _ => LearningModalitiesType.KINESTETIC,
        };
        context.replaceNamed(ProofmasterRoute.learningModalitiesQuiz,
            pathParameters: {
              "id": widget.id,
              "type": selectedResult.toString()
            });
        break;
      case DiagnosticTestRoute.proofFormat:
        final score =
            ref.read(quizProvider.notifier).getMajorityAnswersOption();
        final selectedResult = switch (score) {
          0 => ProofFormatPreferenceType.PARAGRAPH,
          1 => ProofFormatPreferenceType.TWO_COLUMN,
          2 => ProofFormatPreferenceType.FLOW_CHART,
          _ => ProofFormatPreferenceType.PARAGRAPH,
        };
        context.replaceNamed(ProofmasterRoute.proofFormatQuiz, pathParameters: {
          "id": widget.id,
          "type": selectedResult.toString()
        });
        break;
      default:
        throw Exception("Id Quiz tidak valid!");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);

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
                  title: "widget.id",
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
                      onSubmit: () {
                        try {
                          performSubmitQuiz();
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
                errorMessage: "$error",
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
