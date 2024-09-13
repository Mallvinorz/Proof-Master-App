import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/diagnostic_test_quiz.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/learning_modalitites_result_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/prior_knowledge_result_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/diagnostic_test/quiz/results/proof_format_preference_result_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/introduction_to_proof/introduction_to_proof_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/introduction_to_proof/material/introduction_to_proof_material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/proof_competence_test/proof_competence_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/proof_competence_test/quiz/proof_competence_quiz.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/proof_competence_test/quiz/results/result_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/activity/activity_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/menu/understanding_to_proof_structure/understanding_proof_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/student_dashboard_view.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/home/lecturer_dashboard_view.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/reports/lecturer_report_view.dart';
import 'package:proofmaster/app/presentation/dashboard/teacher/settings/lecturer_settings_view.dart';
import 'package:proofmaster/app/presentation/forget_password/forgot_password_view.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';
import 'package:proofmaster/app/presentation/signin/signin_view.dart';
import 'package:proofmaster/app/presentation/signup/signup_view.dart';
import 'package:proofmaster/app/presentation/success_reset_pass/success_reset_pass.dart';

class ProofmasterRoute {
  static const String home = '/';
  static const String lecturerHome = '/lecturer-dashboard';
  static const String onBoarding = '/onboarding';
  static const String auth = '/auth';
  static const String score = '/score';
  static const String register = '/register';
  static const String diagnosticTest = '/diagnostic-test';
  static const String diagnosticTestQuiz = 'diagnostic-test-quiz';
  static const String learningModalitiesQuiz = "/learning-modalities";
  static const String priorKnowledgeQuiz = "/prior-knowledge";
  static const String proofFormatQuiz = "/proof-format";
  static const String introductionProof = '/introduction-proof';
  static const String introductionProofMaterial = 'introduction-proof-material';
  static const String understandingProof = '/understanding-proof';
  static const String understandingProofActivity =
      'understanding-proof-activity';
  static const String proofCompetenceTest = '/proof-competence-test';
  static const String forgotPassword = '/forgot-password';
  static const String successResetPassword = '/success-reset-password';
  static const String lecturerSettings = '/lecturer-settings';
  static const String lecturerReports = '/lecturer-reports';
}

List<RouteBase> getRoutes() {
  return [
    GoRoute(
      path: ProofmasterRoute.home,
      builder: (BuildContext context, GoRouterState state) {
        return const StudentDashboardView();
      },
    ),
    GoRoute(
      path: ProofmasterRoute.lecturerHome,
      builder: (BuildContext context, GoRouterState state) {
        return const LecturerDashboardView();
      },
    ),
    GoRoute(
      path: ProofmasterRoute.auth,
      builder: (BuildContext context, GoRouterState state) {
        return const SigninView();
      },
    ),
    GoRoute(
      path: ProofmasterRoute.register,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupView();
      },
    ),
    GoRoute(
      path: ProofmasterRoute.onBoarding,
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
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
      path: '${ProofmasterRoute.score}/:score',
      name: ProofmasterRoute.score,
      builder: (BuildContext context, GoRouterState state) {
        return ResultView(
          score:
              double.tryParse(state.pathParameters['score'].toString()) ?? 0.0,
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.learningModalitiesQuiz}/:type',
      name: ProofmasterRoute.learningModalitiesQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return LearningModalititesResultView(
          type: LearningModalitiesType.values
              .firstWhere((d) => d.toString() == state.pathParameters['type']),
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.proofFormatQuiz}/:type',
      name: ProofmasterRoute.proofFormatQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return ProofFormatPreferenceResultView(
          type: ProofFormatPreferenceType.values
              .firstWhere((d) => d.toString() == state.pathParameters['type']),
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.priorKnowledgeQuiz}/:type',
      name: ProofmasterRoute.priorKnowledgeQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return PriorKnowledgeResultView(
          type: PriorKnowledgeType.values
              .firstWhere((d) => d.toString() == state.pathParameters['type']),
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.proofCompetenceTest}/:id/:title',
      name: ProofmasterRoute.proofCompetenceTest,
      builder: (BuildContext context, GoRouterState state) {
        return ProofCompetenceQuiz(
          id: state.pathParameters['id'] ?? "-",
          title: state.pathParameters['title'] ?? "-",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.diagnosticTest}/${ProofmasterRoute.diagnosticTestQuiz}/:id/:title',
      name: ProofmasterRoute.diagnosticTestQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return DiagnosticTestQuiz(
          id: state.pathParameters['id'] ?? "-",
          title: state.pathParameters['title'] ?? "-",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.introductionProof}/${ProofmasterRoute.introductionProofMaterial}/:id/:title',
      name: ProofmasterRoute.introductionProofMaterial,
      builder: (BuildContext context, GoRouterState state) {
        return IntroductionToProofMaterial(
          id: state.pathParameters['id'] ?? "-",
          title: state.pathParameters['title'] ?? "-",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.understandingProof}/${ProofmasterRoute.understandingProofActivity}/:id/:title',
      name: ProofmasterRoute.understandingProofActivity,
      builder: (BuildContext context, GoRouterState state) {
        return ActivityView(
          id: state.pathParameters['id'] ?? "-",
          title: state.pathParameters['title'] ?? "-",
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.lecturerSettings,
      builder: (BuildContext context, GoRouterState state) {
        return const LecturerSettingsView();
      },
    ),
    GoRoute(
        path: ProofmasterRoute.lecturerReports,
        builder: (BuildContext context, GoRouterState state) {
          return const LecturerReportView();
        })
  ];
}
