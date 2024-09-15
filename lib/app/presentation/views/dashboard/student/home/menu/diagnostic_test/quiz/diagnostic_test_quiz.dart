import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/learning_modalitites_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/prior_knowledge_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/proof_format_preference_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/go_back_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/widgets/submit_quiz_dialog.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/templates/quiz_template.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';

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

      // final quizId = switch (widget.id) {
      //   "learning-modalities" => "1cd25bcd-625c-4615-89d8-eedd845e8274",
      //   "prior-knowledge" => "7225aec2-5e4a-4802-9131-2d17bb49306c",
      //   "proof-format" => "fc7ac1a9-a715-444e-a372-608e21b3b966",
      //   _ => "-"
      // };
      ref
          .read(getDiagnosticQuizQuestionsFromProvider(
                  widget.id) //TODO: replace with actual id from api endpoint
              .future)
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

  @override
  Widget build(BuildContext context) {
    print(widget.id);

    final quizUiState = ref.watch(quizProvider);
    final quizQuestionsAsyncValue = ref.watch(
        getDiagnosticQuizQuestionsFromProvider(
            widget.id)); //TODO: replace with actual id

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final shouldPop = await goBackQuizDialog(context);
        if (shouldPop == true) {
          if (context.mounted) {
            context
                .pop(); // Use this instead of Navigator.pop for consistency with GoRouter
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
                      onSubmit: () {
                        context.pop();
                        switch (widget.id) {
                          case "prior-knowledge":
                            final score = ref
                                .read(quizProvider.notifier)
                                .calculateQuizScorePriorKnowledge();
                            final selectedResult = switch (score) {
                              > 0 && <= 4 => PriorKnowledgeType.ONE,
                              > 4 && <= 8 => PriorKnowledgeType.TWO,
                              > 9 && <= 12 => PriorKnowledgeType.THREE,
                              > 12 && <= 16 => PriorKnowledgeType.FOUR,
                              > 16 && <= 19 => PriorKnowledgeType.FIVE,
                              20 => PriorKnowledgeType.SIX,
                              _ => PriorKnowledgeType.ONE,
                            };
                            context.replaceNamed(
                                ProofmasterRoute.priorKnowledgeQuiz,
                                pathParameters: {
                                  "type": selectedResult.toString()
                                });
                            break;
                          case "learning-modalities":
                            final score = ref
                                .read(quizProvider.notifier)
                                .getMajorityAnswersOption();
                            print(score);
                            final selectedResult = switch (score) {
                              0 => LearningModalitiesType.VISUAL,
                              1 => LearningModalitiesType.AUDITORY,
                              2 => LearningModalitiesType.KINESTETIC,
                              _ => LearningModalitiesType.KINESTETIC,
                            };
                            context.replaceNamed(
                                ProofmasterRoute.learningModalitiesQuiz,
                                pathParameters: {
                                  "type": selectedResult.toString()
                                });
                            break;
                          case "proof-format":
                            final score = ref
                                .read(quizProvider.notifier)
                                .getMajorityAnswersOption();
                            final selectedResult = switch (score) {
                              0 => ProofFormatPreferenceType.PARAGRAPH,
                              1 => ProofFormatPreferenceType.TWO_COLUMN,
                              2 => ProofFormatPreferenceType.FLOW_CHART,
                              _ => ProofFormatPreferenceType.PARAGRAPH,
                            };
                            context.replaceNamed(
                                ProofmasterRoute.proofFormatQuiz,
                                pathParameters: {
                                  "type": selectedResult.toString()
                                });
                            break;
                          default:
                            break;
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
