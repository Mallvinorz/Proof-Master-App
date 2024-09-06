// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedAnsweValue: (json['selectedAnsweValue'] as num?)?.toInt(),
      correctAnswerValue: (json['correctAnswerValue'] as num?)?.toInt(),
      imgUrl: json['imgUrl'] as String?,
      marked: json['marked'] as bool?,
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'options': instance.options,
      'selectedAnsweValue': instance.selectedAnsweValue,
      'correctAnswerValue': instance.correctAnswerValue,
      'imgUrl': instance.imgUrl,
      'marked': instance.marked,
    };
