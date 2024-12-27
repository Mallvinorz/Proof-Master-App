import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/templates/report/diagnostic_test/detail/learning_modalitites_test_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/diagnostic_test/detail/prior_knowledge_test_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/diagnostic_test/detail/proof_format_preference_test_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/diagnostic_test/diagnostic_test_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/introduction_proof/introduction_proof_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/proof_competence_test/proof_competence_test_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/understanding_proof/detail/detail_activity_report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/understanding_proof/understanding_proof_report_view.dart';
import 'package:proofmaster/app/presentation/views/change_pfp/change_pfp_views.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/diagnostic_test_quiz.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/learning_modalitites_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/prior_knowledge_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/diagnostic_test/quiz/results/proof_format_preference_result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/introduction_to_proof/introduction_to_proof_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/introduction_to_proof/material/introduction_to_proof_material.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/proof_competence_test/proof_competence_test_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/proof_competence_test/quiz/proof_competence_quiz.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/proof_competence_test/quiz/results/result_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/understanding_to_proof_structure/activity/activity_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/menu/understanding_to_proof_structure/understanding_proof_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/student_dashboard_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/home/lecturer_dashboard_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/reports/lecturer_report_view.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/settings/lecturer_settings_view.dart';
import 'package:proofmaster/app/presentation/views/forget_password/forgot_password_view.dart';
import 'package:proofmaster/app/presentation/views/onboarding/onboarding_view.dart';
import 'package:proofmaster/app/presentation/views/signin/signin_view.dart';
import 'package:proofmaster/app/presentation/views/signup/signup_view.dart';
import 'package:proofmaster/app/presentation/views/success_reset_pass/success_reset_pass.dart';
import 'package:proofmaster/constanta.dart';

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
      '/understanding-proof-activity';
  static const String proofCompetenceTest = '/proof-competence-test';
  static const String forgotPassword = '/forgot-password';
  static const String successResetPassword = '/success-reset-password';
  static const String lecturerSettings = '/lecturer-settings';
  static const String lecturerReports = '/lecturer-reports';
  //menu reports
  static const String diagnosticTestReport = '/diagnostic-test-report';
  static const String introductionTestReport = '/introduction-proof-report';
  static const String geometricProofReport = '/geometric-proof-report';
  static const String understandingProofReport = '/understanding-proof-report';
  static const String proofCompetenceReport = '/proof-competence-report';
  //menu reports students (diagnostic)
  static const String reportDiagnosticLearningModalitits =
      '/report-diagnostic-learning-modalities';
  static const String reportDiagnosticPriorKnowledge =
      '/report-diagnostic-prior-knowledge';
  static const String reportDiagnosticProofFormat =
      '/report-diagnostic-proof-format';
  //menu reports students (understading proof activity)
  static const String understandingProofReportDetail =
      '/understanding-proof-report-detail';

  static const String changePfp = '/change-pfp';
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
      path: '${ProofmasterRoute.learningModalitiesQuiz}/:id/:type',
      name: ProofmasterRoute.learningModalitiesQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return LearningModalititesResultView(
          id: state.pathParameters['id']!,
          type: LearningModalitiesType.values.firstWhere(
            (d) => d.toString() == state.pathParameters['type'],
          ),
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.proofFormatQuiz}/:id/:type',
      name: ProofmasterRoute.proofFormatQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return ProofFormatPreferenceResultView(
          id: state.pathParameters['id']!,
          type: ProofFormatPreferenceType.values.firstWhere(
            (d) => d.toString() == state.pathParameters['type'],
          ),
        );
      },
    ),
    GoRoute(
      path: '${ProofmasterRoute.priorKnowledgeQuiz}/:id/:type',
      name: ProofmasterRoute.priorKnowledgeQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return PriorKnowledgeResultView(
          id: state.pathParameters['id']!,
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
          id: state.pathParameters['id'] ?? "",
          title: state.pathParameters['title'] ?? "",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.diagnosticTest}/${ProofmasterRoute.diagnosticTestQuiz}/:id/:title',
      name: ProofmasterRoute.diagnosticTestQuiz,
      builder: (BuildContext context, GoRouterState state) {
        return DiagnosticTestQuiz(
          id: state.pathParameters['id'] ?? "",
          title: state.pathParameters['title'] ?? "",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.introductionProof}/${ProofmasterRoute.introductionProofMaterial}/:id/:title/:pdfUrl',
      name: ProofmasterRoute.introductionProofMaterial,
      builder: (BuildContext context, GoRouterState state) {
        return IntroductionToProofMaterial(
          pdfUrl: state.pathParameters['pdfUrl'] ?? "",
          id: state.pathParameters['id'] ?? "",
          title: state.pathParameters['title'] ?? "",
        );
      },
    ),
    GoRoute(
      path:
          '${ProofmasterRoute.understandingProof}/${ProofmasterRoute.understandingProofActivity}/:id/:title',
      name: ProofmasterRoute.understandingProofActivity,
      builder: (BuildContext context, GoRouterState state) {
        return ActivityView(
          id: state.pathParameters['id'] ?? "",
          title: state.pathParameters['title'] ?? "",
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
      path: "${ProofmasterRoute.lecturerReports}/:studentId/:studentName",
      name: ProofmasterRoute.lecturerReports,
      builder: (BuildContext context, GoRouterState state) {
        return LecturerReportView(
          studentId: state.pathParameters['studentId'] ?? "",
          studentName: state.pathParameters['studentName'] ?? "",
        );
      },
    ),
    //report menus
    GoRoute(
      path: ProofmasterRoute.diagnosticTestReport,
      name: ProofmasterRoute.diagnosticTestReport,
      builder: (BuildContext context, GoRouterState state) {
        return DiagnosticTestReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.introductionTestReport,
      name: ProofmasterRoute.introductionTestReport,
      builder: (BuildContext context, GoRouterState state) {
        return IntroductionProofReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.understandingProofReport,
      name: ProofmasterRoute.understandingProofReport,
      builder: (BuildContext context, GoRouterState state) {
        return UnderstandngProofReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.proofCompetenceReport,
      name: ProofmasterRoute.proofCompetenceReport,
      builder: (BuildContext context, GoRouterState state) {
        return ProofCompetenceTestReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    //report result diagnostic
    GoRoute(
      path: ProofmasterRoute.reportDiagnosticLearningModalitits,
      name: ProofmasterRoute.reportDiagnosticLearningModalitits,
      builder: (BuildContext context, GoRouterState state) {
        return LearningModalititiesReport(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.reportDiagnosticPriorKnowledge,
      name: ProofmasterRoute.reportDiagnosticPriorKnowledge,
      builder: (BuildContext context, GoRouterState state) {
        return PriorKnowledgeTestReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    GoRoute(
      path: ProofmasterRoute.reportDiagnosticProofFormat,
      name: ProofmasterRoute.reportDiagnosticProofFormat,
      builder: (BuildContext context, GoRouterState state) {
        return ProofFormatPreferenceTestReportView(
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    //report understanding proof
    GoRoute(
      path: ProofmasterRoute.understandingProofReportDetail,
      name: ProofmasterRoute.understandingProofReportDetail,
      builder: (BuildContext context, GoRouterState state) {
        return DetailActivityReportView(
          activityId: state.uri.queryParameters['activityId'],
          title: state.uri.queryParameters['title'] ?? "Aktivitas",
          studentId: state.uri.queryParameters['studentId'],
        );
      },
    ),
    // change pfp
    GoRoute(
        path: ProofmasterRoute.changePfp,
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePfpView();
        })
  ];
}
