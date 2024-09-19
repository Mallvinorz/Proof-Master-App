// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      isSeparator: json['isSeparator'] as bool,
      iconUrl: json['iconUrl'] as String?,
      separatorText: json['separatorText'] as String?,
      menuText: json['menuText'] as String?,
      menuDesc: json['menuDesc'] as String?,
      route: json['route'] as String?,
      category: json['category'] as String?,
      learningMaterial: json['learningMaterial'] == null
          ? null
          : LearningMaterial.fromJson(
              json['learningMaterial'] as Map<String, dynamic>),
      pdfUrl: json['pdfUrl'] as String?,
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'isSeparator': instance.isSeparator,
      'iconUrl': instance.iconUrl,
      'separatorText': instance.separatorText,
      'menuText': instance.menuText,
      'menuDesc': instance.menuDesc,
      'route': instance.route,
      'category': instance.category,
      'learningMaterial': instance.learningMaterial,
      'pdfUrl': instance.pdfUrl,
    };
