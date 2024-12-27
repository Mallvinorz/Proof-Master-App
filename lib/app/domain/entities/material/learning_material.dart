import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_material.freezed.dart';
part 'learning_material.g.dart';

@freezed
class LearningMaterial with _$LearningMaterial {
  factory LearningMaterial({
    required String name,
    required String desc,
    required int totalSubLearningMaterial,
    required int finishedSubLearningMaterial,
    required bool isLocked,
  }) = _LearningMaterial;

  factory LearningMaterial.fromJson(Map<String, dynamic> json) =>
      _$LearningMaterialFromJson(json);
}
