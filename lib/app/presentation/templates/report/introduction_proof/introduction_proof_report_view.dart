import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/domain/entities/intro_proof_report_item/intro_proof_report_item.dart';
import 'package:proofmaster/app/presentation/providers/report_provider/report_provider.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template_asyncvalue.dart';
import 'package:proofmaster/app/presentation/templates/report/introduction_proof/widgets/item.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';
import 'package:proofmaster/app/utils/ui_state.dart';

class IntroductionProofReportView extends ConsumerWidget {
  final String? studentId;
  const IntroductionProofReportView({super.key, this.studentId});

  Future<UIState<List<IntroProofReportItem>>> getDummyData() {
    final dummy = [
      IntroProofReportItem(finishedCount: 10, text: "Logika", totalCount: 10),
      IntroProofReportItem(finishedCount: 10, text: "Teorema", totalCount: 10),
      IntroProofReportItem(finishedCount: 10, text: "Axioma", totalCount: 10),
      IntroProofReportItem(
          finishedCount: 10, text: "Definition of Terms", totalCount: 10),
      IntroProofReportItem(
          finishedCount: 10, text: "Geometric Proof", totalCount: 10),
    ];
    return Future.value(UISuccess(dummy));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportState =
        ref.watch(introductionProgressReportProvider(studentId: studentId));
    final isRefreshing = ref.watch(isRefreshingProvider);

    return ListItemTemplateAsyncvalue<IntroProofReportItem>(
      title: "Introduction to Proof Report",
      asyncData: isRefreshing ? const AsyncValue.loading() : reportState,
      shimmerLoaderChild: () {
        return const ShimmerLoader(
          isLoading: true,
          child: IntroductionProofItem(
            text: "",
            finished: true,
            finishedCount: 10,
            totalCount: 10,
          ),
        );
      },
      onRefresh: () {
        ref
            .watch(introductionProgressReportProvider(studentId: studentId)
                .notifier)
            .refresh(studentId: studentId);
      },
      child: (IntroProofReportItem data) => Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: IntroductionProofItem(
            text: data.text,
            finished: data.finishedCount >= data.totalCount,
            finishedCount: data.finishedCount,
            totalCount: data.totalCount),
      ),
    );
  }
}
