// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizOptionImpl _$$QuizOptionImplFromJson(Map<String, dynamic> json) =>
    _$QuizOptionImpl(
      text: json['text'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizOptionImplToJson(_$QuizOptionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
