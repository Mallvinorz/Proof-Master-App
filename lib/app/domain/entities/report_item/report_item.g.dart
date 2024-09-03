// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportItemImpl _$$ReportItemImplFromJson(Map<String, dynamic> json) =>
    _$ReportItemImpl(
      route: json['route'] as String,
      textTitle: json['textTitle'] as String,
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$$ReportItemImplToJson(_$ReportItemImpl instance) =>
    <String, dynamic>{
      'route': instance.route,
      'textTitle': instance.textTitle,
      'progress': instance.progress,
    };
