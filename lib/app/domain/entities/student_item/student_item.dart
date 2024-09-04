import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_item.freezed.dart';
part 'student_item.g.dart';

@freezed
class StudentItem with _$StudentItem {
  const factory StudentItem({
    required String name,
    String? route,
  }) = _StudentItem;

  factory StudentItem.fromJson(Map<String, Object?> json) =>
      _$StudentItemFromJson(json);
}
