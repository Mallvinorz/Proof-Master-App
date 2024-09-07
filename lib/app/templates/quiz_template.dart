import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/domain/entities/quiz_option/quiz_option.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/option_item.dart';

class QuizTemplate extends StatelessWidget {
  final String title;
  final QuizState quizState;
  final Function(int) moveQuizIndex;
  final Function(int) toggleMarkSelectedQuestion;
  final Function(int value, int index) onSelectQuizAnswer;
  final Function goToNextQuestion;
  final Function goToPrevQuestion;
  final Function toggleQuizNavigation;
  final Function onSubmitQuiz;
  const QuizTemplate({
    super.key,
    required this.quizState,
    required this.title,
    required this.moveQuizIndex,
    required this.goToNextQuestion,
    required this.goToPrevQuestion,
    required this.onSelectQuizAnswer,
    required this.toggleMarkSelectedQuestion,
    required this.toggleQuizNavigation,
    required this.onSubmitQuiz,
  });

  @override
  Widget build(BuildContext context) {
    print("Rebuilding QuizTemplate: ${quizState.currentQuestionIndex}");

    final textStyleNumber =
        CustomTextTheme.proofMasterTextTheme.displayMedium?.copyWith(
      color: CustomColorTheme.colorBackground,
      fontWeight: FontWeight.bold,
    );
    return quizState.openQuestionsNavigation
        ? _buildQuizNumbersContent(textStyleNumber)
        : _buildQuizContent(textStyleNumber);
  }

  Widget _buildQuizContent(TextStyle? textStyleNumber) {
    return QuestionContainer(
      key: Key("key-${quizState.questions[quizState.currentQuestionIndex].id}"),
      child: Stack(
        children: [
          Column(
            children: [
              _buildQuizHeader(textStyleNumber),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 52.0),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 28, bottom: 52),
                    child: _buildQuizBody(
                        quizState.questions[quizState.currentQuestionIndex]),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildQuizContentNavigationButtons(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizContentNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        quizState.currentQuestionIndex > 0
            ? Button(
                onTap: () => quizState.currentQuestionIndex > 0
                    ? goToPrevQuestion()
                    : showToast("Sudah mencapai soal paling awal!"),
                text: "Sebelumnya",
                isOutlined: true,
              )
            : const SizedBox(),
        Button(
            onTap: () =>
                quizState.currentQuestionIndex == quizState.questions.length - 1
                    ? onSubmitQuiz()
                    : goToNextQuestion(),
            text:
                quizState.currentQuestionIndex == quizState.questions.length - 1
                    ? "Selesaikan quiz"
                    : "Selanjutnya"),
      ],
    );
  }

  Widget _buildQuizNumbersContent(TextStyle? textStyleNumber) {
    return QuestionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => toggleQuizNavigation(),
                icon: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: CustomColorTheme.colorPrimary,
                ),
              ),
              Text(
                "Kembali ke soal quiz",
                style: CustomTextTheme.proofMasterTextTheme.displaySmall
                    ?.copyWith(color: CustomColorTheme.colorPrimary),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 24),
              itemCount: quizState.questions.length,
              itemBuilder: (ctx, index) => NumberButton(
                onTap: () {
                  moveQuizIndex(index);
                  toggleQuizNavigation();
                },
                content: Text(
                  "${index + 1}",
                  style: textStyleNumber,
                ),
                backgroundColor: quizState.questions[index].marked == true
                    ? CustomColorTheme.colorYellowIndicator
                    : quizState.questions[index].selectedAnsweValue != null
                        ? CustomColorTheme.colorPrimary
                        : Colors.grey,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizHeader(TextStyle? textStyleNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumberButton(
          onTap: () => toggleQuizNavigation(),
          content: Text(
            "${quizState.currentQuestionIndex + 1}",
            style: textStyleNumber,
          ),
          backgroundColor: CustomColorTheme.colorPrimary,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text("Tandai soal ini"),
            ),
            NumberButton(
              onTap: () =>
                  toggleMarkSelectedQuestion(quizState.currentQuestionIndex),
              useBorder: true,
              content:
                  quizState.questions[quizState.currentQuestionIndex].marked ==
                          true
                      ? const Icon(FontAwesomeIcons.check)
                      : const SizedBox() //TODO: change later,
              ,
              backgroundColor:
                  quizState.questions[quizState.currentQuestionIndex].marked ==
                          true
                      ? CustomColorTheme.colorYellowIndicator
                      : Colors.transparent,
            )
          ],
        )
      ],
    );
  }

  Widget _buildQuizBody(QuizQuestion question) => Column(
        key: Key(
            "body-${quizState.questions[quizState.currentQuestionIndex].id}"),
        children: [
          if (quizState.questions[quizState.currentQuestionIndex].imgUrl !=
              null)
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: const Image(
                width: double.infinity,
                image: AssetImage("assets/images/dumy_avatar.jpeg"),
              ),
            ),
          if (quizState.questions[quizState.currentQuestionIndex].imgUrl !=
              null)
            const SizedBox(height: 16),
          _buildQuizQuestion(question),
        ],
      );

  Widget _buildQuizQuestion(QuizQuestion question) {
    return Column(
      key: Key(
          "question-${quizState.questions[quizState.currentQuestionIndex].id}"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text),
        const SizedBox(height: 16),
        ..._buildQuizOptions(question.options),
      ],
    );
  }

  List<Widget> _buildQuizOptions(List<QuizOption> options) {
    return options
        .mapIndexed((index, item) => Padding(
              key: Key(
                  "option-container-${quizState.questions[quizState.currentQuestionIndex].id}-${item.value}"),
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OptionItem<int>(
                key: Key(
                    "option-child-${quizState.questions[quizState.currentQuestionIndex].id}-${item.value}"),
                selected: item.value ==
                    quizState.questions[quizState.currentQuestionIndex]
                        .selectedAnsweValue,
                text: item.text,
                value: item.value,
                onSelected: (value) {
                  onSelectQuizAnswer(value, quizState.currentQuestionIndex);
                },
              ),
            ))
        .toList();
  }
}

class QuestionContainer extends StatelessWidget {
  final Widget child;
  const QuestionContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: child,
    );
  }
}

class NumberButton extends StatelessWidget {
  final Widget content;
  final Color backgroundColor;
  final Function onTap;
  final bool useBorder;

  const NumberButton({
    super.key,
    required this.content,
    required this.backgroundColor,
    required this.onTap,
    this.useBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: Colors.black, width: (useBorder ? 1 : 0)),
      ),
      color: backgroundColor,
      child: InkWell(
        onTap: () => onTap(),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(child: content),
        ),
      ),
    );
  }
}
