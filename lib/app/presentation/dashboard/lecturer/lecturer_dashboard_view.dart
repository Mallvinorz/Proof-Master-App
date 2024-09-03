import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/student_item/student_item.dart';
import 'package:proofmaster/app/presentation/dashboard/lecturer/widgets/lecturer_dashboard_content.dart';
import 'package:proofmaster/app/presentation/dashboard/lecturer/widgets/top_banner_lecturer_dashboard.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';

class LecturerDashboardView extends StatelessWidget {
  const LecturerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
        topChildren: const TopBannerLecturerDashboard(),
        mainChildren: LecturerDashboardContent(items: dummyItems));
  }
}

final dummyItems = [
  const StudentItem(name: "Roni"),
  const StudentItem(name: "El Gasing"),
  const StudentItem(name: "Cucurella"),
  const StudentItem(name: "Beyond"),
  const StudentItem(name: "Zuppa Soup"),
  const StudentItem(name: "Pottato Chips"),
  const StudentItem(name: "Burrito"),
  const StudentItem(name: "Harry Maguire"),
  const StudentItem(name: "Onana Kocak"),
  const StudentItem(name: "Anak Fifa"),
  const StudentItem(name: "Warung Bekicot Magetan")
];
