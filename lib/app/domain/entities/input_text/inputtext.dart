import 'package:freezed_annotation/freezed_annotation.dart';

part 'inputtext.freezed.dart';
part 'inputtext.g.dart';

@freezed
class InputText with _$InputText {
  factory InputText({
    required String value,
    String? errorMessage,
    int? minLen,
    int? maxLen,
    bool? isRequired,
    String? regexCheck,
  }) = _InputText;

  factory InputText.fromJson(Map<String, dynamic> json) =>
      _$InputTextFromJson(json);
}
