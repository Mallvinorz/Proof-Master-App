import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/domain/entities/quiz_option/quiz_option.dart';
import 'package:proofmaster/app/domain/entities/quiz_question/quiz_question.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/providers/quiz_provider/quiz_provider.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/option_item.dart';

class QuizTemplate extends StatefulWidget {
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
  State<QuizTemplate> createState() => _QuizTemplateState();
}

class _QuizTemplateState extends State<QuizTemplate> {
  bool onFinishLoadContent = false;
  @override
  Widget build(BuildContext context) {
    print("Rebuilding QuizTemplate: ${widget.quizState.currentQuestionIndex}");

    final textStyleNumber =
        CustomTextTheme.proofMasterTextTheme.displayMedium?.copyWith(
      color: CustomColorTheme.colorBackground,
      fontWeight: FontWeight.bold,
    );
    return widget.quizState.openQuestionsNavigation
        ? _buildQuizNumbersContent(textStyleNumber)
        : _buildQuizContent(textStyleNumber);
  }

  Widget _buildQuizContent(TextStyle? textStyleNumber) {
    return QuestionContainer(
      key: Key(
          "key-${widget.quizState.questions[widget.quizState.currentQuestionIndex].id}"),
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
                    child: _buildQuizBody(widget.quizState
                        .questions[widget.quizState.currentQuestionIndex]),
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
        widget.quizState.currentQuestionIndex > 0
            ? Button(
                onTap: () => widget.quizState.currentQuestionIndex > 0
                    ? widget.goToPrevQuestion()
                    : showToast("Sudah mencapai soal paling awal!"),
                text: "Sebelumnya",
                isOutlined: true,
              )
            : const SizedBox(),
        Button(
            onTap: () {
              widget.quizState.currentQuestionIndex ==
                      widget.quizState.questions.length - 1
                  ? widget.onSubmitQuiz()
                  : widget.goToNextQuestion();
              setState(() {
                onFinishLoadContent = false;
              });
            },
            text: widget.quizState.currentQuestionIndex ==
                    widget.quizState.questions.length - 1
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
                onPressed: () => widget.toggleQuizNavigation(),
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
              itemCount: widget.quizState.questions.length,
              itemBuilder: (ctx, index) => NumberButton(
                onTap: () {
                  widget.moveQuizIndex(index);
                  widget.toggleQuizNavigation();
                },
                content: Text(
                  "${index + 1}",
                  style: textStyleNumber,
                ),
                backgroundColor: widget.quizState.questions[index].marked ==
                        true
                    ? CustomColorTheme.colorYellowIndicator
                    : widget.quizState.questions[index].selectedAnsweValue !=
                            null
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
          onTap: () => widget.toggleQuizNavigation(),
          content: Text(
            "${widget.quizState.currentQuestionIndex + 1}",
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
              onTap: () => widget.toggleMarkSelectedQuestion(
                  widget.quizState.currentQuestionIndex),
              useBorder: true,
              content: widget
                          .quizState
                          .questions[widget.quizState.currentQuestionIndex]
                          .marked ==
                      true
                  ? const Icon(FontAwesomeIcons.check)
                  : const SizedBox(),
              backgroundColor: widget
                          .quizState
                          .questions[widget.quizState.currentQuestionIndex]
                          .marked ==
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
            "body-${widget.quizState.questions[widget.quizState.currentQuestionIndex].id}"),
        children: [
          if (widget.quizState.questions[widget.quizState.currentQuestionIndex]
                  .imgUrl !=
              null)
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Image(
                width: double.infinity,
                image: NetworkImage(widget.quizState
                    .questions[widget.quizState.currentQuestionIndex].imgUrl!),
              ),
            ),
          if (widget.quizState.questions[widget.quizState.currentQuestionIndex]
                  .imgUrl !=
              null)
            const SizedBox(height: 16),
          _buildQuizQuestion(question),
        ],
      );

  Widget _buildQuizQuestion(QuizQuestion question) {
    return Column(
      key: Key(
          "question-${widget.quizState.questions[widget.quizState.currentQuestionIndex].id}"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeXView(
            onRenderFinished: (height) {
              setState(() {
                onFinishLoadContent = true;
              });
            },
            renderingEngine: const TeXViewRenderingEngine.katex(),
            child: TeXViewDocument(question.text)),
        const SizedBox(height: 16),
        onFinishLoadContent
            ? Column(
                children: [
                  ..._buildQuizOptions(question.options),
                ],
              )
            : const Center(child: CircularProgressIndicator())
      ],
    );
  }

  List<Widget> _buildQuizOptions(List<QuizOption> options) {
    return options
        .mapIndexed((index, item) => Padding(
              key: Key(
                  "option-container-${widget.quizState.questions[widget.quizState.currentQuestionIndex].id}-${item.value}"),
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OptionItem<int>(
                key: Key(
                    "option-child-${widget.quizState.questions[widget.quizState.currentQuestionIndex].id}-${item.value}"),
                selected: item.value ==
                    widget
                        .quizState
                        .questions[widget.quizState.currentQuestionIndex]
                        .selectedAnsweValue,
                text: item.text,
                value: item.value,
                onSelected: (value) {
                  widget.onSelectQuizAnswer(
                      value, widget.quizState.currentQuestionIndex);
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
