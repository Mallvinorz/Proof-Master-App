import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/domain/entities/material/learning_material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/widgets/dashboard_content.dart';
import 'package:proofmaster/app/presentation/dashboard/student/widgets/top_banner.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/widgets/bottom_bar.dart';

class StudentDashboardView extends StatelessWidget {
  StudentDashboardView({super.key});

  final dummyItems = [
    const MenuItem(isSeparator: true, separatorText: "Pre-Test"),
    MenuItem(
        iconUrl: 'assets/icons/diagnostic_ic.png',
        isSeparator: false,
        learningMaterial: LearningMaterial(
            name: "Diagnostic Test",
            desc: "Lorem ipsum dolor sit amet consectetur.",
            totalSubLearningMaterial: 10,
            finishedSubLearningMaterial: 10,
            isLocked: false)),
    const MenuItem(isSeparator: true, separatorText: "Materi"),
    MenuItem(
        iconUrl: 'assets/icons/introduction_proof_ic.png',
        isSeparator: false,
        learningMaterial: LearningMaterial(
            name: "Introduction to Proof",
            desc: "Lorem ipsum dolor sit amet consectetur.",
            totalSubLearningMaterial: 10,
            finishedSubLearningMaterial: 10,
            isLocked: false)),
    MenuItem(
        iconUrl: 'assets/icons/geometric_proof_ic.png',
        isSeparator: false,
        learningMaterial: LearningMaterial(
            name: "Geometry Proof Format",
            desc: "Lorem ipsum dolor sit amet consectetur.",
            totalSubLearningMaterial: 10,
            finishedSubLearningMaterial: 10,
            isLocked: false)),
    MenuItem(
        iconUrl: 'assets/icons/understanding_proof_ic.png',
        isSeparator: false,
        learningMaterial: LearningMaterial(
            name: "Understanding of Proof Structure",
            desc: "Lorem ipsum dolor sit amet consectetur.",
            totalSubLearningMaterial: 10,
            finishedSubLearningMaterial: 10,
            isLocked: false)),
    const MenuItem(isSeparator: true, separatorText: "Pre-Test"),
    MenuItem(
        iconUrl: 'assets/icons/proof_competence_ic.png',
        isSeparator: false,
        learningMaterial: LearningMaterial(
            name: "Proof Competence Test",
            desc: "Lorem ipsum dolor sit amet consectetur.",
            totalSubLearningMaterial: 10,
            finishedSubLearningMaterial: 10,
            isLocked: false)),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      topChildren: const TopBanner(),
      mainChildren: DashboardContent(items: dummyItems),
      bottomBar: const BottomBar(),
    );
  }

  Widget _margin() {
    return const SizedBox(
      height: 16,
    );
  }
}
