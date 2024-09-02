import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostic_test_item.freezed.dart';
part 'diagnostic_test_item.g.dart';

@freezed
class DiagnosticTestItem with _$DiagnosticTestItem {
  factory DiagnosticTestItem({
    required String id,
    required String text,
    String? iconUrl,
  }) = _DiagnosticTestItem;

  factory DiagnosticTestItem.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticTestItemFromJson(json);
}
