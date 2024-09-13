import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/quiz_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepositoryImpl(http.Client());
}

@riverpod
Future<List<QuizQuestion>> getDiagnosticQuizQuestionsFrom(
    GetDiagnosticQuizQuestionsFromRef ref, String id) {
  return ref.watch(quizRepositoryProvider).getDiagnosticQuizQuestionsFrom(id);
}

@riverpod
Future<List<QuizQuestion>> getProofCompetenceQuizQuestionsFrom(
    GetProofCompetenceQuizQuestionsFromRef ref, String id) {
  return ref
      .watch(quizRepositoryProvider)
      .getProofCompetenceQuizQuestionsFrom(id);
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

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentQuestionIndex,
    bool? openQuestionsNavigation,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      openQuestionsNavigation:
          openQuestionsNavigation ?? this.openQuestionsNavigation,
    );
  }
}

@riverpod
class Quiz extends _$Quiz {
  @override
  QuizState build() {
    return QuizState(questions: []);
  }

  void initQuiz(List<QuizQuestion> questions) {
    state = QuizState(questions: questions);
  }

  void updateSelectedAnswer(int selectedValue, int questionIndex) {
    final updatedQuestions = [...state.questions];
    final selectedQuestion = updatedQuestions[questionIndex];
    updatedQuestions[questionIndex] = selectedQuestion.copyWith(
      selectedAnsweValue: selectedValue == selectedQuestion.selectedAnsweValue
          ? null
          : selectedValue,
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

  double calculateQuizScore() {
    final correctAnswer = state.questions
        .where((question) =>
            question.selectedAnsweValue == question.correctAnswerValue)
        .length;
    final totalQuestion = state.questions.length;
    return correctAnswer / totalQuestion * 100;
  }

  int calculateQuizScorePriorKnowledge() {
    final correctAnswer = state.questions
        .where((question) =>
            question.selectedAnsweValue == question.correctAnswerValue)
        .length;
    return correctAnswer;
  }

  int getMajorityAnswersOption() {
    Map<int, int> frequency = {};
    state.questions.forEach((question) {
      if (frequency.containsKey(question.selectedAnsweValue)) {
        if (question.selectedAnsweValue != null) {
          frequency[question.selectedAnsweValue ?? -1] =
              frequency[question.selectedAnsweValue ?? -1]! + 1;
        }
      } else {
        frequency[question.selectedAnsweValue ?? -1] = 1;
      }
    });

    int maxFrequency = 0;
    int mostFrequentOption = -1;

    for (final entry in frequency.entries) {
      if (entry.value > maxFrequency) {
        maxFrequency = entry.value;
        mostFrequentOption = entry.key;
      }
    }

    return mostFrequentOption;
  }

  void toggleQuizNavigation() {
    state =
        state.copyWith(openQuestionsNavigation: !state.openQuestionsNavigation);
  }
}
