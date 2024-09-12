import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/dashboard/student/report/widgets/rectangle_indicator.dart';
import 'package:proofmaster/app/presentation/dashboard/student/report/widgets/text_indicator.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/error_handler.dart';

class ReportView extends ConsumerWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportProgressUiState = ref.watch(getReportProgressProvider);

    return reportProgressUiState.when(
        data: (data) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // TODO: Implement on click to route navigation
                  },
                  child: Card(
                    elevation: 4.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data[index].textTitle} ${data[index].progress}",
                            style: CustomTextTheme
                                .proofMasterTextTheme.displaySmall,
                            maxLines: 2,
                          ),
                          RectangleIndicator(progress: data[index].progress),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextIndicator(progress: data[index].progress)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
        error: (error, _) => ErrorHandler(
            errorMessage: "$error",
            action: () async {
              // ignore: unused_result
              ref.refresh(getReportProgressProvider);
            }),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
