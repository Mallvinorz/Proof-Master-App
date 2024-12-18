import 'package:freezed_annotation/freezed_annotation.dart';

part 'registerdto.freezed.dart';
part 'registerdto.g.dart';

@freezed
class RegisterDTO with _$RegisterDTO {
  factory RegisterDTO({
    required String email,
    required String password,
    required String nim,
    required String name,
  }) = _RegisterDTO;

  factory RegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterDTOFromJson(json);
}
