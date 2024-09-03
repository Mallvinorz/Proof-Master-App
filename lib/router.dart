import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/diagnostic_test_quiz.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/introduction_to_proof/introduction_to_proof_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/introduction_to_proof/material/introduction_to_proof_material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/proof_competence_test/proof_competence_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/activity/activity_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/student_dashboard_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/understanding_proof_report_view.dart';
import 'package:proofmaster/app/presentation/forget_password/forgot_password_view.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';
import 'package:proofmaster/app/presentation/success_reset_pass/success_reset_pass.dart';
import 'package:proofmaster/app/templates/material_viewer.dart';

class ProofmasterRoute {
  static String onBoarding = 'onboarding';
  static String auth = 'auth';
  static String score = 'score';
  static String register = 'register';
  static String diagnosticTest = 'diagnostic-test';
  static String diagnosticTestQuiz = 'diagnostic-test-quiz';
  static String introductionProof = 'introduction-proof';
  static String introductionProofMaterial = 'introduction-proof-material';
  static String understandingProof = 'understanding-proof';
  static String understandingProofActivity = 'understanding-proof-activity';
  static String proofCompetenceTest = 'proof-competence-test';
  static String forgotPassword = 'forgot-password';
  static String successResetPassword = 'success-reset-password';
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
        GoRoute(
          path: ProofmasterRoute.forgotPassword,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordView();
          },
        ),
        GoRoute(
          path: ProofmasterRoute.successResetPassword,
          builder: (BuildContext context, GoRouterState state) {
            return const SuccessResetPass();
          },
        ),
        GoRoute(
          path: '${ProofmasterRoute.diagnosticTestQuiz}/:id/:title',
          name: ProofmasterRoute.diagnosticTestQuiz,
          builder: (BuildContext context, GoRouterState state) {
            return DiagnosticTestQuiz(
              id: state.pathParameters['id'] ?? "-",
              title: state.pathParameters['title'] ?? "-",
            );
          },
        ),
        GoRoute(
          path: '${ProofmasterRoute.introductionProofMaterial}/:id/:title',
          name: ProofmasterRoute.introductionProofMaterial,
          builder: (BuildContext context, GoRouterState state) {
            return IntroductionToProofMaterial(
              id: state.pathParameters['id'] ?? "-",
              title: state.pathParameters['title'] ?? "-",
            );
          },
        ),
        GoRoute(
          path: '${ProofmasterRoute.understandingProofActivity}/:id/:title',
          name: ProofmasterRoute.understandingProofActivity,
          builder: (BuildContext context, GoRouterState state) {
            return ActivityView(
              id: state.pathParameters['id'] ?? "-",
              title: state.pathParameters['title'] ?? "-",
            );
          },
        ),
      ],
    ),
  ],
);
