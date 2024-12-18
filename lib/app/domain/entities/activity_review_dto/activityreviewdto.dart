import 'package:freezed_annotation/freezed_annotation.dart';

part 'activityreviewdto.freezed.dart';
part 'activityreviewdto.g.dart';

@freezed
class ActivityReviewDto with _$ActivityReviewDto {
  factory ActivityReviewDto({
    required String comment,
    required String activityId,
  }) = _ActivityReviewDto;

  factory ActivityReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityReviewDtoFromJson(json);
}
