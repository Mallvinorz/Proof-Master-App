import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_item.freezed.dart';
part 'report_item.g.dart';

@freezed
class ReportItem with _$ReportItem {
  factory ReportItem({
    required String route,
    required String textTitle,
    required double progress,
  }) = _ReportItem;

  factory ReportItem.fromJson(Map<String, dynamic> json) =>
      _$ReportItemFromJson(json);
}
