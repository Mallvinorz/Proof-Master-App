import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/diagnostic_itest_tem/diagnostic_test_item.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/router.dart';

class DiagnosticTestRoute {
  static const String learningModalities = "learning-modalities-test";
  static const String priorKnowledge = "prior-knowledge-test";
  static const String proofFormat = "proof-format-preference-test";
}

class DiagnosticTestView extends StatelessWidget {
  DiagnosticTestView({super.key});

  final _diagnosticTestMenus = [
    DiagnosticTestItem(
      endpoint: DiagnosticTestRoute.learningModalities,
      text: "Learning Modalities",
      iconUrl: "assets/icons/learning_ic.png",
    ),
    DiagnosticTestItem(
      endpoint: DiagnosticTestRoute.priorKnowledge,
      text: "Prior Knowledge",
      iconUrl: "assets/icons/prior_ic.png",
    ),
    DiagnosticTestItem(
      endpoint: DiagnosticTestRoute.proofFormat,
      text: "Proof Format Preference",
      iconUrl: "assets/icons/proof_ic.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      appBarTitle: "Diagnostic Test",
      topChildren: const SizedBox(
        height: 44,
      ),
      borderRadius: const BorderRadius.only(topRight: Radius.circular(36)),
      mainChildren: GridView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: _diagnosticTestMenus.length,
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () => context
              .pushNamed(ProofmasterRoute.diagnosticTestQuiz, pathParameters: {
            'id': _diagnosticTestMenus[index].endpoint,
            'title': _diagnosticTestMenus[index].text
          }),
          child: SizedBox(
            width: 80,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _diagnosticTestMenus[index].iconUrl != null
                        ? Image.asset(
                            _diagnosticTestMenus[index].iconUrl!,
                            width: 48,
                            height: 48,
                          )
                        : const Icon(FontAwesomeIcons.accusoft),
                  ),
                ),
                Text(
                  _diagnosticTestMenus[index].text,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 3,
            childAspectRatio: 0.8),
      ),
    );
  }
}
