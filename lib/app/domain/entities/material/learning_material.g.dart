// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningMaterialImpl _$$LearningMaterialImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningMaterialImpl(
      name: json['name'] as String,
      desc: json['desc'] as String,
      totalSubLearningMaterial:
          (json['totalSubLearningMaterial'] as num).toInt(),
      finishedSubLearningMaterial:
          (json['finishedSubLearningMaterial'] as num).toInt(),
      isLocked: json['isLocked'] as bool,
    );

Map<String, dynamic> _$$LearningMaterialImplToJson(
        _$LearningMaterialImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'totalSubLearningMaterial': instance.totalSubLearningMaterial,
      'finishedSubLearningMaterial': instance.finishedSubLearningMaterial,
      'isLocked': instance.isLocked,
    };
