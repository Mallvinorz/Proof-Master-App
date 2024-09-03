// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic_test_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosticTestItemImpl _$$DiagnosticTestItemImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosticTestItemImpl(
      endpoint: json['endpoint'] as String,
      text: json['text'] as String,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$DiagnosticTestItemImplToJson(
        _$DiagnosticTestItemImpl instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'text': instance.text,
      'iconUrl': instance.iconUrl,
    };
