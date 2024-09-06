import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/quiz_repository_impl.dart';
import 'package:proofmaster/app/data/responses/student/get_quiz_questions_response/get_quiz_questions_response.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepositoryImpl(http.Client());
}

@riverpod
Future<List<QuizQuestion>> getQuizQuestionsFrom(
    GetQuizQuestionsFromRef ref, String id) {
  return ref.watch(quizRepositoryProvider).getQuizQuestionsFrom(id);
}

class QuizState {
  final List<QuizQuestion> questions;
  final int currentQuestionIndex;
  final bool openQuestionsNavigation;

  QuizState({
    required this.questions,
    this.currentQuestionIndex = 0,
    this.openQuestionsNavigation = false,
  });

  QuizState copyWith(
      {List<QuizQuestion>? questions,
      int? currentQuestionIndex,
      bool? openQuestionsNavigation}) {
    return QuizState(
        questions: questions ?? this.questions,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        openQuestionsNavigation:
            openQuestionsNavigation ?? this.openQuestionsNavigation);
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState(questions: []));

  void initQuiz(List<QuizQuestion> questions) {
    state = QuizState(questions: questions);
  }

  void updateSelectedAnswer(int selectedValue, int questionIndex) {
    final updatedQuestions = [...state.questions];
    print("value $selectedValue $questionIndex");
    updatedQuestions[questionIndex] = updatedQuestions[questionIndex].copyWith(
      selectedAnsweValue: selectedValue,
    );
    state = state.copyWith(questions: updatedQuestions);
  }

  void toggleMarkedQuestion(int questionIndex) {
    final updatedQuestions = [...state.questions];
    updatedQuestions[questionIndex] = updatedQuestions[questionIndex].copyWith(
      marked: !(updatedQuestions[questionIndex].marked ?? false),
    );
    state = state.copyWith(questions: updatedQuestions);
  }

  void goToNextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    }
  }

  void goToPreviousQuestion() {
    if (state.currentQuestionIndex > 0) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1);
    }
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < state.questions.length) {
      state = state.copyWith(currentQuestionIndex: index);
    }
  }

  List<int> getMarkedQuestionIndexes() {
    return state.questions
        .asMap()
        .entries
        .where((entry) => entry.value.marked ?? false)
        .map((entry) => entry.key)
        .toList();
  }

  void toggleQuizNavigation() {
    state =
        state.copyWith(openQuestionsNavigation: !state.openQuestionsNavigation);
    print(state.openQuestionsNavigation);
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});
