import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/domain/entities/material/learning_material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/dashboard_content.dart';
import 'package:proofmaster/app/presentation/dashboard/student/home/widgets/top_banner.dart';
import 'package:proofmaster/app/presentation/dashboard/student/report/report_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/report/widgets/top_banner_report.dart';
import 'package:proofmaster/app/presentation/dashboard/student/settings/widgets/settings_content.dart';
import 'package:proofmaster/app/presentation/dashboard/student/settings/widgets/top_banner_settings.dart';
import 'package:proofmaster/app/presentation/providers/dashboard_provider/dashboard_provider.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/widgets/bottom_bar.dart';

class StudentDashboardView extends ConsumerStatefulWidget {
  const StudentDashboardView({super.key});

  @override
  ConsumerState<StudentDashboardView> createState() =>
      _StudentDashboardViewState();
}

class _StudentDashboardViewState extends ConsumerState<StudentDashboardView> {
  int _currentPage = 0;
  final List<Map<String, Widget>> dashboardBottomNavDestination = [
    {
      'topChildren': const TopBannerHome(),
      'mainChildren': const DashboardContent(),
    },
    {
      'topChildren': const TopBannerReport(),
      'mainChildren': ReportView(),
    },
    {
      'topChildren': const TopBannerSettings(),
      'mainChildren': const SettingsContent(),
    },
  ];

  DashboardRepository? dashboardRepository;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardRepository = ref.watch(dashboardRepositoryProvider);
    });
  }

  @override
  void dispose() {
    dashboardRepository?.dispose();
    dashboardRepository = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      topChildren:
          dashboardBottomNavDestination[_currentPage].containsKey('topChildren')
              ? dashboardBottomNavDestination[_currentPage]['topChildren']!
              : const SizedBox.shrink(),
      mainChildren: dashboardBottomNavDestination[_currentPage]
              .containsKey('mainChildren')
          ? dashboardBottomNavDestination[_currentPage]['mainChildren']!
          : const Center(child: Text("Unknown child")),
      bottomBar: BottomBar(
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
      ),
    );
  }
}

final dummyItems = [
  const MenuItem(isSeparator: true, separatorText: "Pre-Test"),
  MenuItem(
      route: ProofmasterRoute.diagnosticTest,
      iconUrl: 'assets/icons/diagnostic_ic.png',
      isSeparator: false,
      learningMaterial: LearningMaterial(
          name: "Diagnostic Test",
          desc: "Lorem ipsum dolor sit amet consectetur.",
          totalSubLearningMaterial: 10,
          finishedSubLearningMaterial: 10,
          isLocked: false)),
  const MenuItem(isSeparator: true, separatorText: "Materi"),
  MenuItem(
      route: ProofmasterRoute.introductionProof,
      iconUrl: 'assets/icons/introduction_proof_ic.png',
      isSeparator: false,
      learningMaterial: LearningMaterial(
          name: "Introduction to Proof",
          desc: "Lorem ipsum dolor sit amet consectetur.",
          totalSubLearningMaterial: 10,
          finishedSubLearningMaterial: 10,
          isLocked: false)),
  MenuItem(
      route: ProofmasterRoute.introductionProof,
      iconUrl: 'assets/icons/geometric_proof_ic.png',
      isSeparator: false,
      learningMaterial: LearningMaterial(
          name: "Geometry Proof Format",
          desc: "Lorem ipsum dolor sit amet consectetur.",
          totalSubLearningMaterial: 10,
          finishedSubLearningMaterial: 10,
          isLocked: false)),
  MenuItem(
      route: ProofmasterRoute.understandingProof,
      iconUrl: 'assets/icons/understanding_proof_ic.png',
      isSeparator: false,
      learningMaterial: LearningMaterial(
          name: "Understanding of Proof Structure",
          desc: "Lorem ipsum dolor sit amet consectetur.",
          totalSubLearningMaterial: 10,
          finishedSubLearningMaterial: 10,
          isLocked: false)),
  const MenuItem(isSeparator: true, separatorText: "Pre-Test"),
  MenuItem(
      route: ProofmasterRoute.proofCompetenceTest,
      iconUrl: 'assets/icons/proof_competence_ic.png',
      isSeparator: false,
      learningMaterial: LearningMaterial(
          name: "Proof Competence Test",
          desc: "Lorem ipsum dolor sit amet consectetur.",
          totalSubLearningMaterial: 10,
          finishedSubLearningMaterial: 10,
          isLocked: false)),
];
