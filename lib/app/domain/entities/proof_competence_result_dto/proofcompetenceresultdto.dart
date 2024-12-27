import 'package:freezed_annotation/freezed_annotation.dart';

part 'proofcompetenceresultdto.freezed.dart';
part 'proofcompetenceresultdto.g.dart';

@freezed
class ProofCompetenceResultDto with _$ProofCompetenceResultDto {
  factory ProofCompetenceResultDto({required int score}) =
      _ProofCompetenceResultDto;

  factory ProofCompetenceResultDto.fromJson(Map<String, dynamic> json) =>
      _$ProofCompetenceResultDtoFromJson(json);
}
