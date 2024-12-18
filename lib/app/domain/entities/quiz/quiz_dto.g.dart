// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      prerequisiteDesc: json['prerequisiteDesc'] as String?,
      prerequisiteImg: json['prerequisiteImg'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'prerequisiteDesc': instance.prerequisiteDesc,
      'prerequisiteImg': instance.prerequisiteImg,
      'questions': instance.questions,
    };
