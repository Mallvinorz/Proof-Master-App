import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/repositories/quiz_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/quiz/quiz_dto.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/domain/repositories/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepositoryImpl();
}

@riverpod
Future<QuizDTO> getDiagnosticQuizQuestionsFrom(
    GetDiagnosticQuizQuestionsFromRef ref, String id) {
  return ref.watch(quizRepositoryProvider).getDiagnosticQuizQuestionsFrom(id);
}

@riverpod
Future<QuizDTO> getProofCompetenceQuizQuestionsFrom(
    GetProofCompetenceQuizQuestionsFromRef ref, String id) {
  return ref
      .watch(quizRepositoryProvider)
      .getProofCompetenceQuizQuestionsFrom(id);
}

class QuizState {
  final List<QuizQuestion> questions;
  final int currentQuestionIndex;
  final bool openQuestionsNavigation;
  final String? prerequisiteDesc;
  final String? prerequisiteImg;

  QuizState({
    required this.questions,
    this.currentQuestionIndex = 0,
    this.openQuestionsNavigation = false,
    this.prerequisiteDesc = null,
    this.prerequisiteImg = null,
  });

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentQuestionIndex,
    bool? openQuestionsNavigation,
    String? prerequisiteDesc,
    String? prerequisiteImg,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      openQuestionsNavigation:
          openQuestionsNavigation ?? this.openQuestionsNavigation,
      prerequisiteDesc: prerequisiteDesc ?? this.prerequisiteDesc,
      prerequisiteImg: prerequisiteImg ?? this.prerequisiteImg,
    );
  }
}

@riverpod
class Quiz extends _$Quiz {
  @override
  QuizState build() {
    return QuizState(questions: []);
  }

  void initQuiz(List<QuizQuestion> questions, String? prerequisiteImg,
      String? prerequisiteDesc) {
    state = QuizState(
        questions: questions,
        prerequisiteDesc: prerequisiteDesc,
        prerequisiteImg: prerequisiteImg);
    if (prerequisiteImg != null && prerequisiteDesc != null) {
      final prerequisiteQuestion = QuizQuestion(
        id: "-",
        text: prerequisiteDesc,
        options: [],
        imgUrl: prerequisiteImg,
        selectedAnsweValue: 0,
      );
      state =
          state.copyWith(questions: [prerequisiteQuestion, ...state.questions]);
    }
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

  void checkAllQuestionsIsAnswered() {
    final totalQUizLen = state.questions.length;
    final answeredQuizLen = state.questions
        .where((question) => question.selectedAnsweValue != null)
        .toList()
        .length;
    if (answeredQuizLen < totalQUizLen) {
      final blankedQuestions = state.questions
          .where((question) => question.selectedAnsweValue == null)
          .map((question) => state.questions.indexOf(question) + 1);
      final strBlankedQuestions = blankedQuestions.join(", ");
      throw Exception(
          "Soal nomor $strBlankedQuestions masih belum dijawab! jawab soal tersebut terlebih dahulu.");
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
    List<QuizQuestion> questions = List<QuizQuestion>.from(state.questions);

    if (state.prerequisiteDesc != null && state.prerequisiteImg != null) {
      questions.removeAt(0);
    }

    final correctAnswer = questions
        .where((question) =>
            question.selectedAnsweValue == question.correctAnswerValue)
        .length;
    final totalQuestion = state.questions.length;
    return correctAnswer / totalQuestion * 100;
  }

  int calculateQuizScorePriorKnowledge() {
    List<QuizQuestion> questions = List<QuizQuestion>.from(state.questions);

    if (state.prerequisiteDesc != null && state.prerequisiteImg != null) {
      questions.removeAt(0);
    }
    final correctAnswer = questions
        .where((question) =>
            question.selectedAnsweValue == question.correctAnswerValue)
        .length;
    Fimber.d("correctAnswer $correctAnswer");
    return correctAnswer;
  }

  int getMajorityAnswersOption() {
    List<QuizQuestion> questions = List<QuizQuestion>.from(state.questions);

    if (state.prerequisiteDesc != null && state.prerequisiteImg != null) {
      questions.removeAt(0);
    }

    Map<int, int> frequency = {};
    for (var question in questions) {
      if (question.selectedAnsweValue != null) {
        if (frequency.containsKey(question.selectedAnsweValue)) {
          frequency[question.selectedAnsweValue ?? -1] =
              frequency[question.selectedAnsweValue ?? -1]! + 1;
        } else {
          frequency[question.selectedAnsweValue ?? -1] = 1;
        }
      }
    }

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
