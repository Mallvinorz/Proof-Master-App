import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/widgets/menu_card_item.dart';

class IntroductionToProofView extends StatelessWidget {
  const IntroductionToProofView({super.key});

  Future<UIState<List<MenuItem>>> getMenuItems() {
    const data = [
      MenuItem(
        iconUrl: 'assets/icons/logic_ic.png',
        isSeparator: false,
        menuText: "Logika",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
      MenuItem(
        iconUrl: 'assets/icons/teorema_ic.png',
        isSeparator: false,
        menuText: "Teorama",
        menuDesc: "Pernyataan matematis yang dapat dibuktikan",
      ),
      MenuItem(
        iconUrl: 'assets/icons/axioma_ic.png',
        isSeparator: false,
        menuText: "Aksioma",
        menuDesc: "Pernyataan matematis yang diakui kebenarannya",
      ),
      MenuItem(
        iconUrl: 'assets/icons/terms_ic.png',
        isSeparator: false,
        menuText: "Definition of Terms",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
      MenuItem(
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
        onTap: () {},
        child: MenuCardItem(menuItem: data),
      ),
    );
  }
}
