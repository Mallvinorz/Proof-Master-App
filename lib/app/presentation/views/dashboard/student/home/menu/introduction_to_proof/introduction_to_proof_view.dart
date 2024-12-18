import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/presentation/providers/introduction_proof_provider/introduction_proof_provider.dart';
import 'package:proofmaster/app/presentation/templates/list_item_template_asyncvalue.dart';
import 'package:proofmaster/app/presentation/widgets/menu_card_item.dart';
import 'package:proofmaster/router.dart';

class IntroductionToProofView extends ConsumerWidget {
  const IntroductionToProofView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(instuductionProofMaterialsProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);
    return ListItemTemplateAsyncvalue<MenuItem>(
      title: "Introduction to Proof",
      asyncData: isRefreshing ? const AsyncValue.loading() : menus,
      shimmerLoaderChild: () => const MenuCardItem(
        menuItem: MenuItem(isSeparator: false, menuText: ""),
      ),
      onRefresh: () {
        ref.read(instuductionProofMaterialsProvider.notifier).refresh();
      },
      child: (data) => GestureDetector(
        onTap: () => context.pushNamed(
            ProofmasterRoute.introductionProofMaterial,
            pathParameters: {
              'id': data.route ?? "-",
              'title': data.menuText ?? "-",
              'pdfUrl': data.pdfUrl ??
                  "https://ik.imagekit.io/q1qexvvey/Android%20Studio%20Application%20Development%20(%20PDFDrive%20).pdf?updatedAt=1725256360219"
            }),
        child: MenuCardItem(menuItem: data),
      ),
    );
  }
}
