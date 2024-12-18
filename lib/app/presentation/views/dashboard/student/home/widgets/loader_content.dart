import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/material/learning_material.dart';
import 'package:proofmaster/app/domain/entities/menu_item/menu_item.dart';
import 'package:proofmaster/app/presentation/views/dashboard/student/home/widgets/dashboard_card_item.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';

class LoaderContent extends StatelessWidget {
  const LoaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60, top: 32),
      itemCount: data.length,
      itemBuilder: (context, index) => ShimmerLoader(
        isLoading: true,
        child: data[index].isSeparator
            ? Text(data[index].separatorText ?? "")
            : DashboardCardItem(
                dashboardItem: data[index],
                learningMaterial: data[index].learningMaterial!,
              ),
      ),
    );
  }
}

var data = [
  const MenuItem(isSeparator: true, menuText: "separator"),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
  MenuItem(
      isSeparator: false,
      learningMaterial: LearningMaterial(
        name: '',
        desc: '',
        totalSubLearningMaterial: 0,
        finishedSubLearningMaterial: 0,
        isLocked: false,
      )),
];
