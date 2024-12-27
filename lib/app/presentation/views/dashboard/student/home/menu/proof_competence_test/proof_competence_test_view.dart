import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/presentation/providers/proof_competence_provider/proof_competence_provider.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template_asyncvalue.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/app/presentation/widgets/menu_card_item.dart';

class ProofCompetenceTestView extends ConsumerWidget {
  const ProofCompetenceTestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final menusAsync = ref.watch(menusProvider);
        final isRefreshing = ref.watch(isRefreshingProvider);

        return ListItemTemplateAsyncvalue<MenuItem>(
          title: 'Proof Competence Test',
          asyncData: isRefreshing ? const AsyncValue.loading() : menusAsync,
          onRefresh: () => ref.read(menusProvider.notifier).refresh(),
          child: (menu) => GestureDetector(
            onTap: () => menu.route != null
                ? context.pushNamed(ProofmasterRoute.proofCompetenceTest,
                    pathParameters: {
                        'id': menu.route!,
                        'title': menu.menuText ?? "-"
                      })
                : null,
            child: MenuCardItem(menuItem: menu),
          ),
          shimmerLoaderChild: () =>
              const MenuCardItem(menuItem: MenuItem(isSeparator: false)),
        );
      },
    );
  }
}
