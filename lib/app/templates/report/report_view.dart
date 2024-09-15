import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/app/templates/report/widgets/rectangle_indicator.dart';
import 'package:proofmaster/app/templates/report/widgets/text_indicator.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/error_handler.dart';
import 'package:proofmaster/widgets/shimmer_loader.dart';

class ReportView extends ConsumerWidget {
  final String? studentId;
  const ReportView({super.key, this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportProgressUiState = studentId != null
        ? ref.watch(StudentReportProgressProvider(studentId!))
        : ref.watch(myReportProgressProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);

    return isRefreshing
        ? const GridLoaderShimmer(childLength: 5)
        : reportProgressUiState.when(
            data: (data) => RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(myReportProgressProvider.notifier).refresh();
                  },
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              final route = "/${data[index].route}";
                              context.pushNamed(route,
                                  queryParameters: {'studentId': studentId});
                              return;
                            },
                            child: Card(
                              elevation: 4.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data[index].textTitle} ${data[index].progress}",
                                      style: CustomTextTheme
                                          .proofMasterTextTheme.displaySmall,
                                      maxLines: 2,
                                    ),
                                    RectangleIndicator(
                                        progress: data[index].progress),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextIndicator(
                                            progress: data[index].progress)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
            error: (error, _) => ErrorHandler(
                errorMessage: "$error",
                action: () async {
                  // ignore: unused_result
                  ref.read(myReportProgressProvider.notifier).refresh();
                }),
            loading: () => const GridLoaderShimmer(childLength: 5));
  }
}

class GridLoaderShimmer extends StatelessWidget {
  final int childLength;
  const GridLoaderShimmer({super.key, required this.childLength});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: childLength,
        itemBuilder: (context, index) => const ShimmerLoader(
              isLoading: true,
              child: Card(
                elevation: 4.0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "loading",
                      ),
                      RectangleIndicator(progress: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [TextIndicator(progress: 0)],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
