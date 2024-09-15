import 'package:freezed_annotation/freezed_annotation.dart';

part 'resetpassworddto.freezed.dart';
part 'resetpassworddto.g.dart';

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  factory ResetPasswordDto({required String email}) = _ResetPasswordDto;

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}
