import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/presentation/providers/activity_provider/activity_provider.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template_asyncvalue.dart';
import 'package:proofmaster/app/presentation/widgets/clickable_item_with_icon.dart';
import 'package:proofmaster/router.dart';

class UnderstandngProofReportView extends ConsumerWidget {
  final String? studentId;
  const UnderstandngProofReportView({super.key, required this.studentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = studentId != null && studentId!.isNotEmpty
        ? ref.watch(proofUnderstadingAnsweredActivitiesProvider(studentId!))
        : ref.watch(proofUnderstadingActivitiesProvider);
    final isRefreshing = studentId != null && studentId!.isNotEmpty
        ? ref.watch(isRefreshingAnsweredProvider)
        : ref.watch(isRefreshingProvider);

    return ListItemTemplateAsyncvalue<ListItem>(
      title: "Understading Proof Structure Report",
      asyncData: isRefreshing ? const AsyncValue.loading() : activities,
      shimmerLoaderChild: () => ClickableListItemWithIcon(
        onTap: () => {},
        iconUrl: "",
        text: "",
      ),
      onRefresh: () {
        studentId != null && studentId!.isNotEmpty
            ? ref
                .watch(proofUnderstadingAnsweredActivitiesProvider(studentId!)
                    .notifier)
                .refresh(studentId!)
            : ref.read(proofUnderstadingActivitiesProvider.notifier).refresh();
      },
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () => context.pushNamed(
            ProofmasterRoute.understandingProofReportDetail,
            queryParameters: {
              "activityId": data.id,
              "title": data.text,
              'studentId': studentId
            }),
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
