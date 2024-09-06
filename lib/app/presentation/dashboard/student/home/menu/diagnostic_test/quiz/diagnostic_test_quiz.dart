import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/app/templates/quiz_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/widgets/error_handler.dart';
import 'package:go_router/go_router.dart';

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
          .read(getQuizQuestionsFromProvider(
                  "5e532e5c-2c90-410e-b9cb-ee152d8f4a59") //TODO: replace with actual id from api endpoint
              .future)
          .then((response) {
        print(response);
        if (response.isNotEmpty) {
          ref.read(quizProvider.notifier).initQuiz(response);
        }
      });
    });
  }

  @override
  void dispose() {
    quizRepository?.dispose();
    quizRepository = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizUiState = ref.watch(quizProvider);
    final quizQuestionsAsyncValue = ref.watch(getQuizQuestionsFromProvider(
        "5e532e5c-2c90-410e-b9cb-ee152d8f4a59")); //TODO: replace with actual id

    return BackgroundPattern(
      onTapNavBack: () async {
        await _dialogBuilderQuiz(context);
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
                toggleMarkSelectedQuestion: (int index) =>
                    ref.read(quizProvider.notifier).toggleMarkedQuestion(index),
                toggleQuizNavigation: () =>
                    ref.read(quizProvider.notifier).toggleQuizNavigation(),
              ),
        error: (error, _) => Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ErrorHandler(
              errorMessage: "$error",
              action: () =>
                  ref.refresh(getQuizQuestionsFromProvider(widget.id)),
            )),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilderQuiz(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Apakah anda yakin ingin quiz?'),
        content: const Text(
          'Saat ini anda sedang mengerjakan quiz, keluar dari quiz yang sedang berlangsung akan membuat progres anda hilang',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ya, saya yakin'),
            onPressed: () {
              Navigator.of(context).pop();
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
