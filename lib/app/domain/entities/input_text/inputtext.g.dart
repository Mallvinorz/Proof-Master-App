// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputtext.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InputTextImpl _$$InputTextImplFromJson(Map<String, dynamic> json) =>
    _$InputTextImpl(
      value: json['value'] as String,
      errorMessage: json['errorMessage'] as String?,
      minLen: (json['minLen'] as num?)?.toInt(),
      maxLen: (json['maxLen'] as num?)?.toInt(),
      isRequired: json['isRequired'] as bool?,
      regexCheck: json['regexCheck'] as String?,
    );

Map<String, dynamic> _$$InputTextImplToJson(_$InputTextImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'errorMessage': instance.errorMessage,
      'minLen': instance.minLen,
      'maxLen': instance.maxLen,
      'isRequired': instance.isRequired,
      'regexCheck': instance.regexCheck,
    };
