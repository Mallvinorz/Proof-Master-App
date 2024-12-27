import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/home/widgets/lecturer_dashboard_content.dart';
import 'package:proofmaster/app/presentation/views/dashboard/teacher/home/widgets/top_banner_lecturer_dashboard.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';

class LecturerDashboardView extends ConsumerStatefulWidget {
  const LecturerDashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LecturerDashboardViewState();
}

class _LecturerDashboardViewState extends ConsumerState<LecturerDashboardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProvider.notifier).refresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
        topChildren: const TopBannerLecturerDashboard(),
        mainChildren: const LecturerDashboardContent());
  }
}
