import 'package:freezed_annotation/freezed_annotation.dart';

part 'signindto.freezed.dart';
part 'signindto.g.dart';

@freezed
class SIgninDTO with _$SIgninDTO {
  factory SIgninDTO({
    required String email,
    required String password,
  }) = _SIgninDTO;

  factory SIgninDTO.fromJson(Map<String, dynamic> json) =>
      _$SIgninDTOFromJson(json);
}
