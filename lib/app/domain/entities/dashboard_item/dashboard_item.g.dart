// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardItemImpl _$$DashboardItemImplFromJson(Map<String, dynamic> json) =>
    _$DashboardItemImpl(
      isSeparator: json['isSeparator'] as bool,
      iconUrl: json['iconUrl'] as String?,
      separatorText: json['separatorText'] as String?,
      learningMaterial: json['learningMaterial'] == null
          ? null
          : LearningMaterial.fromJson(
              json['learningMaterial'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardItemImplToJson(_$DashboardItemImpl instance) =>
    <String, dynamic>{
      'isSeparator': instance.isSeparator,
      'iconUrl': instance.iconUrl,
      'separatorText': instance.separatorText,
      'learningMaterial': instance.learningMaterial,
    };
