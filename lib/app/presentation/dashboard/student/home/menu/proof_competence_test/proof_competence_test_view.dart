import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/templates/list_item_template.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/widgets/menu_card_item.dart';

class ProofCompetenceTestView extends StatelessWidget {
  const ProofCompetenceTestView({super.key});

  Future<UIState<List<MenuItem>>> getMenuItems() {
    const data = [
      MenuItem(
        iconUrl: 'assets/icons/test_ic.png',
        isSeparator: false,
        menuText: "Reading Comprehension Test",
        menuDesc: "Lorem ipsum dolor sit amet consectetur.",
      ),
      MenuItem(
        iconUrl: 'assets/icons/test_ic.png',
        isSeparator: false,
        menuText: "Geometry Proof Construction Test",
        menuDesc: "Pernyataan matematis yang dapat dibuktikan",
      ),
    ];
    return Future.value(const UISuccess(data));
  }

  @override
  Widget build(BuildContext context) {
    return ListItemTemplate<MenuItem>(
      title: "Proof Competence Test",
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
