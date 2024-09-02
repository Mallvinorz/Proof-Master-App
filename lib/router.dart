import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/introduction_to_proof/introduction_to_proof_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/proof_competence_test/proof_competence_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/student_dashboard_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/understanding_to_proof_structure/understanding_proof_report_view.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';

class ProofmasterRoute {
  static String onBoarding = 'onboarding';
  static String diagnosticTest = 'diagnostic-test';
  static String introductionProof = 'introduction-proof';
  static String understandingProof = 'understanding-proof';
  static String proofCompetenceTest = 'proof-competence-test';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return StudentDashboardView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: ProofmasterRoute.onBoarding,
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingView();
          },
        ),
        GoRoute(
          path: ProofmasterRoute.diagnosticTest,
          builder: (BuildContext context, GoRouterState state) {
            return DiagnosticTestView();
          },
        ),
        GoRoute(
          path: ProofmasterRoute.introductionProof,
          builder: (BuildContext context, GoRouterState state) {
            return const IntroductionToProofView();
          },
        ),
        GoRoute(
          path: ProofmasterRoute.understandingProof,
          builder: (BuildContext context, GoRouterState state) {
            return const UnderstandngProofView();
          },
        ),
        GoRoute(
          path: ProofmasterRoute.proofCompetenceTest,
          builder: (BuildContext context, GoRouterState state) {
            return const ProofCompetenceTestView();
          },
        ),
      ],
    ),
  ],
);
