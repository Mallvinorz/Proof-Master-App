import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'postunderstandingproofanswedto.freezed.dart';

@freezed
class PostUnderstandingProofAnsweDto with _$PostUnderstandingProofAnsweDto {
  factory PostUnderstandingProofAnsweDto({
    required File pdfFile,
    required String activityId,
  }) = _PostUnderstandingProofAnsweDto;
}
