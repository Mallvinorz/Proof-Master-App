import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/dashboard_item/dashboard_item.dart';
import 'package:proofmaster/app/presentation/dashboard/student/widgets/dashboard_card_item.dart';

class DashboardContent extends StatelessWidget {
  final List<DashboardItem> items;
  const DashboardContent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: AssetImage('assets/images/img_bg.png')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 60, top: 32),
            itemCount: items.length,
            itemBuilder: (context, index) => items[index].isSeparator
                ? Text(items[index].separatorText ?? "")
                : DashboardCardItem(
                    dashboardItem: items[index],
                    learningMaterial: items[index].learningMaterial!,
                  ),
          ),
        ),
      ],
    );
  }
}
