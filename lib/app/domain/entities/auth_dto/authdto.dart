import 'package:freezed_annotation/freezed_annotation.dart';

part 'authdto.freezed.dart';
part 'authdto.g.dart';

@freezed
class AuthDTO with _$AuthDTO {
  factory AuthDTO({required String email, required String password}) = _AuthDTO;

  factory AuthDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthDTOFromJson(json);
}
