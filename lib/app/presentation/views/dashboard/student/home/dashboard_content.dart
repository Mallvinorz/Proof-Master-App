import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/helper/toast.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/widgets/dashboard_card_item.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/widgets/loader_content.dart';
import 'package:proofmaster/app/presentation/providers/dashboard_provider/dashboard_provider.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';

class DashboardContent extends ConsumerWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardStudentMenuAsync = ref.watch(dashboardStudentMenusProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);

    return Stack(children: [
      const Image(image: AssetImage('assets/images/img_bg.png')),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isRefreshing
            ? const LoaderContent()
            : dashboardStudentMenuAsync.when(
                data: (data) => RefreshIndicator(
                      onRefresh: () async {
                        await ref
                            .read(dashboardStudentMenusProvider.notifier)
                            .refresh();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 60, top: 32),
                        itemCount: data.length,
                        itemBuilder: (context, index) => data[index].isSeparator
                            ? Text(data[index].separatorText ?? "")
                            : GestureDetector(
                                onTap: () =>
                                    data[index].learningMaterial?.isLocked ==
                                            true
                                        ? showToast("Masih terkunci")
                                        : context.push('/${data[index].route}'),
                                child: DashboardCardItem(
                                  dashboardItem: data[index],
                                  learningMaterial:
                                      data[index].learningMaterial!,
                                ),
                              ),
                      ),
                    ),
                error: (error, _) => ErrorHandler(
                    errorMessage: "$error",
                    action: () => ref
                        .read(dashboardStudentMenusProvider.notifier)
                        .refresh()),
                loading: () => const LoaderContent()),
      )
    ]);
  }
}
