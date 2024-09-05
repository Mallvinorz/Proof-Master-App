import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/app/templates/quiz_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/widgets/error_handler.dart';

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
    final quizUiState = ref.watch(getQuizQuestionsFromProvider(widget.id));

    return BackgroundPattern(
      usePatternBg: false,
      appBarTitle: widget.title,
      mainChildren: quizUiState.when(
        data: (quizes) => QuizTemplate(title: widget.title),
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
