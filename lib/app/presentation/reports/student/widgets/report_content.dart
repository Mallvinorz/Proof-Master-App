import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/reports/student/widgets/report_card_item.dart';

class ReportContent extends StatelessWidget {
  const ReportContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            // TODO: Implement on click to route navigation
          },
          child: ReportCardItem(),
        )
        );
  }
}
