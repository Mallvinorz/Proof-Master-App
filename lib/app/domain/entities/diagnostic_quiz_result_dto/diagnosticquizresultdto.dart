import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosticquizresultdto.freezed.dart';
part 'diagnosticquizresultdto.g.dart';

@freezed
class DiagnosticQuizResultDto with _$DiagnosticQuizResultDto {
  factory DiagnosticQuizResultDto({
    required String result,
  }) = _DiagnosticQuizResultDto;

  factory DiagnosticQuizResultDto.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticQuizResultDtoFromJson(json);
}
