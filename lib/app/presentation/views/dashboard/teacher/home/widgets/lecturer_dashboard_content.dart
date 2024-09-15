import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/student_provider/student_provider.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/setting_menu_item.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';

class LecturerDashboardContent extends ConsumerWidget {
  const LecturerDashboardContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(studentsProvider);
    final isRefreshing = ref.watch(isRefreshingStudentProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Mahasiswa",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge),
            ],
          ),
          Expanded(
            child: isRefreshing
                ? const _loader()
                : studentsAsync.when(
                    data: (data) => ListView.builder(
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: data.length,
                        itemBuilder: (context, index) => data.isEmpty
                            ? const Text("Tidak ada siswa")
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: SettingMenuItem(
                                  text: data[index]?.name ?? "-",
                                  onTap: () {
                                    final student = data[index];
                                    context.pushNamed(
                                      ProofmasterRoute.lecturerReports,
                                      pathParameters: {
                                        "studentId": student?.id ?? "-",
                                        "studentName": student?.name ?? "-",
                                      },
                                    );
                                  },
                                ),
                              )),
                    error: (error, _) => ErrorHandler(
                        errorMessage: "$error",
                        action: () =>
                            ref.read(studentsProvider.notifier).refresh()),
                    loading: () => const _loader(),
                  ),
          ),
        ],
      ),
    );
  }
}

class _loader extends StatelessWidget {
  const _loader();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ShimmerLoader(
                isLoading: true,
                child: SettingMenuItem(
                  text: "",
                  onTap: () {},
                ),
              ),
            ));
  }
}
