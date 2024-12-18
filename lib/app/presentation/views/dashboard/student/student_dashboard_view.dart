import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/domain/repositories/dashboard_repository.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/dashboard_content.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/widgets/top_banner.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/settings/widgets/settings_content.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/settings/widgets/top_banner_settings.dart';
import 'package:proofmaster/app/presentation/providers/dashboard_provider/dashboard_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/templates/report/report_view.dart';
import 'package:proofmaster/app/presentation/templates/report/widgets/top_banner_report.dart';
import 'package:proofmaster/app/presentation/widgets/bottom_bar.dart';

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
      'mainChildren': const ReportView(),
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
      ref.read(userProvider.notifier).refresh();
    });
  }

  @override
  void dispose() {
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
