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
    final activities = studentId == null
        ? ref.watch(proofUnderstadingActivitiesProvider)
        : ref.watch(proofUnderstadingAnsweredActivitiesProvider(studentId!));
    final isRefreshing = studentId == null
        ? ref.watch(isRefreshingProvider)
        : ref.watch(isRefreshingAnsweredProvider);

    return ListItemTemplateAsyncvalue<ListItem>(
      title: "$studentId to Proof Structure Report",
      asyncData: isRefreshing ? const AsyncValue.loading() : activities,
      shimmerLoaderChild: () => ClickableListItemWithIcon(
        onTap: () => {},
        iconUrl: "",
        text: "",
      ),
      onRefresh: () {
        studentId == null
            ? ref.read(proofUnderstadingActivitiesProvider.notifier).refresh()
            : ref
                .watch(proofUnderstadingAnsweredActivitiesProvider(studentId!)
                    .notifier)
                .refresh(studentId!);
      },
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () => context.pushNamed(
            ProofmasterRoute.understandingProofReportDetail,
            queryParameters: {"activityId": data.id, "title": data.text}),
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
