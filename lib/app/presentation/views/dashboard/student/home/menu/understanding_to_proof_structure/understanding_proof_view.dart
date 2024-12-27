import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/presentation/providers/activity_provider/activity_provider.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template_asyncvalue.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/app/presentation/widgets/clickable_item_with_icon.dart';

class UnderstandngProofView extends ConsumerWidget {
  const UnderstandngProofView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proofUnderstandingActivities =
        ref.watch(proofUnderstadingActivitiesProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);

    return ListItemTemplateAsyncvalue<ListItem>(
      title: "Understanding to Proof Structure",
      numLoadingChild: 4,
      asyncData: isRefreshing
          ? const AsyncValue.loading()
          : proofUnderstandingActivities,
      shimmerLoaderChild: () {
        return ClickableListItemWithIcon(iconUrl: "", text: "", onTap: () {});
      },
      onRefresh: () async {
        await ref.read(proofUnderstadingActivitiesProvider.notifier).refresh();
      },
      child: (ListItem data) => ClickableListItemWithIcon(
        onTap: () {
          context.pushNamed(ProofmasterRoute.understandingProofActivity,
              pathParameters: {'id': data.id, 'title': data.text});
        },
        iconUrl: data.iconUrl,
        text: data.text,
      ),
    );
  }
}
