import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/widgets/menu_card_item.dart';

class IntroductionToProofView extends StatelessWidget {
  const IntroductionToProofView({super.key});

  Future<UIState<List<MenuItem>>> getMenuItems() {
    const data = [
      MenuItem(
        route: 'logic',
        iconUrl: 'assets/icons/logic_ic.png',
        isSeparator: false,
        menuText: "Logika",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
      MenuItem(
        route: 'theorm',
        iconUrl: 'assets/icons/teorema_ic.png',
        isSeparator: false,
        menuText: "Teorama",
        menuDesc: "Pernyataan matematis yang dapat dibuktikan",
      ),
      MenuItem(
        route: 'axiom',
        iconUrl: 'assets/icons/axioma_ic.png',
        isSeparator: false,
        menuText: "Aksioma",
        menuDesc: "Pernyataan matematis yang diakui kebenarannya",
      ),
      MenuItem(
        route: 'definition-of-term',
        iconUrl: 'assets/icons/terms_ic.png',
        isSeparator: false,
        menuText: "Definition of Terms",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
      MenuItem(
        route: 'geometric-proof',
        iconUrl: 'assets/icons/geometric_ic.png',
        isSeparator: false,
        menuText: "Geometric Proof",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
    ];
    return Future.value(UISuccess(data));
  }

  @override
  Widget build(BuildContext context) {
    return ListItemTemplate<MenuItem>(
      title: "Introduction to Proof",
      onLoadData: () {
        //TODO: replace with actual onload data
      },
      futureData: getMenuItems(),
      child: (data) => GestureDetector(
        onTap: () => context.pushNamed(
            ProofmasterRoute.introductionProofMaterial,
            pathParameters: {
              'id': data.route ?? "-",
              'title': data.menuText ?? "-"
            }),
        child: MenuCardItem(menuItem: data),
      ),
    );
  }
}
