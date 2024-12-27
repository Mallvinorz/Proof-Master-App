import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_proof_report_item.freezed.dart';
part 'intro_proof_report_item.g.dart';

@freezed
class IntroProofReportItem with _$IntroProofReportItem {
  factory IntroProofReportItem({
    required String text,
    required int finishedCount,
    required int totalCount,
  }) = _IntroProofReportItem;

  factory IntroProofReportItem.fromJson(Map<String, dynamic> json) =>
      _$IntroProofReportItemFromJson(json);
}
