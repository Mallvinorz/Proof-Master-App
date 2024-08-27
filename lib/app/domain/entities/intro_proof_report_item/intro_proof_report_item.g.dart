// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_proof_report_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntroProofReportItemImpl _$$IntroProofReportItemImplFromJson(
        Map<String, dynamic> json) =>
    _$IntroProofReportItemImpl(
      text: json['text'] as String,
      finishedCount: (json['finishedCount'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$$IntroProofReportItemImplToJson(
        _$IntroProofReportItemImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'finishedCount': instance.finishedCount,
      'totalCount': instance.totalCount,
    };
