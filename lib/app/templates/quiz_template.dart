import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/option_item.dart';

class QuizTemplate extends StatefulWidget {
  const QuizTemplate({super.key});

  @override
  State<QuizTemplate> createState() => _QuizTemplateState();
}

class _QuizTemplateState extends State<QuizTemplate> {
  int _selectedIndexQuiz = 0;
  bool _openNumbers = false;
  bool _markNumber = false;

  void toggleOpenNumber() => setState(() => _openNumbers = !_openNumbers);
  void toggleMarkQuestion() => setState(() => _markNumber = !_markNumber);
  void tapQuizNumberItem(int value) {
    setState(() {
      _openNumbers = false;
      _selectedIndexQuiz = value;
    });
  }

  final _textStyleNumber = CustomTextTheme.proofMasterTextTheme.displayMedium
      ?.copyWith(
          color: CustomColorTheme.colorBackground, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Learning Modalities",
      mainChildren:
          _openNumbers ? _buildQuizNumbersContent() : _buildQuizContent(),
    );
  }

  Widget _buildQuizContent() {
    return QuestionContainer(
      child: Stack(
        children: [
          Column(
            children: [
              _buildQuizHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 52.0),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 28, bottom: 52),
                    child: _buildQuizBody(),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildQuizContentNavigationButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizContentNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Button(
          onTap: () {},
          text: "Sebelumnya",
          isOutlined: true,
        ),
        Button(onTap: () {}, text: "Selanjutnya"),
      ],
    );
  }

  Widget _buildQuizNumbersContent() {
    return QuestionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: toggleOpenNumber,
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
              color: CustomColorTheme.colorPrimary,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 24),
              itemCount: numbers.length,
              itemBuilder: (ctx, index) => NumberButton(
                onTap: () => tapQuizNumberItem(index),
                content: Text(
                  "${index + 1}",
                  style: _textStyleNumber,
                ),
                backgroundColor: Colors.grey,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumberButton(
          onTap: toggleOpenNumber,
          content: Text(
            "01",
            style: _textStyleNumber,
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
              onTap: toggleMarkQuestion,
              useBorder: true,
              content: const SizedBox() //TODO: change later,
              ,
              backgroundColor: Colors.transparent,
            )
          ],
        )
      ],
    );
  }

  Widget _buildQuizBody() {
    return Column(
      children: [
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
        const SizedBox(height: 16),
        _buildQuizQuestion("asd asdlkjasdlsad?"),
      ],
    );
  }

  Widget _buildQuizQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        const SizedBox(height: 16),
        ..._buildQuizOptions(),
      ],
    );
  }

  List<Widget> _buildQuizOptions() {
    return List.generate(
      4,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: OptionItem(
          selected: index == 0,
          text: "Opsi ${index + 1}",
          value: "opsi ${index + 1}",
          onSelected: (value) {},
        ),
      ),
    );
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
  final VoidCallback? onTap;
  final bool useBorder;

  const NumberButton({
    super.key,
    required this.content,
    required this.backgroundColor,
    this.onTap,
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
        onTap: onTap,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(child: content),
        ),
      ),
    );
  }
}

final numbers = List.generate(50, (index) => index + 1);
