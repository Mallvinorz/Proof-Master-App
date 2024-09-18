// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activityreviewdto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityReviewDto _$ActivityReviewDtoFromJson(Map<String, dynamic> json) {
  return _ActivityReviewDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityReviewDto {
  String get comment => throw _privateConstructorUsedError;
  String get activityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityReviewDtoCopyWith<ActivityReviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReviewDtoCopyWith<$Res> {
  factory $ActivityReviewDtoCopyWith(
          ActivityReviewDto value, $Res Function(ActivityReviewDto) then) =
      _$ActivityReviewDtoCopyWithImpl<$Res, ActivityReviewDto>;
  @useResult
  $Res call({String comment, String activityId});
}

/// @nodoc
class _$ActivityReviewDtoCopyWithImpl<$Res, $Val extends ActivityReviewDto>
    implements $ActivityReviewDtoCopyWith<$Res> {
  _$ActivityReviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? activityId = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityReviewDtoImplCopyWith<$Res>
    implements $ActivityReviewDtoCopyWith<$Res> {
  factory _$$ActivityReviewDtoImplCopyWith(_$ActivityReviewDtoImpl value,
          $Res Function(_$ActivityReviewDtoImpl) then) =
      __$$ActivityReviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment, String activityId});
}

/// @nodoc
class __$$ActivityReviewDtoImplCopyWithImpl<$Res>
    extends _$ActivityReviewDtoCopyWithImpl<$Res, _$ActivityReviewDtoImpl>
    implements _$$ActivityReviewDtoImplCopyWith<$Res> {
  __$$ActivityReviewDtoImplCopyWithImpl(_$ActivityReviewDtoImpl _value,
      $Res Function(_$ActivityReviewDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? activityId = null,
  }) {
    return _then(_$ActivityReviewDtoImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityReviewDtoImpl implements _ActivityReviewDto {
  _$ActivityReviewDtoImpl({required this.comment, required this.activityId});

  factory _$ActivityReviewDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityReviewDtoImplFromJson(json);

  @override
  final String comment;
  @override
  final String activityId;

  @override
  String toString() {
    return 'ActivityReviewDto(comment: $comment, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityReviewDtoImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comment, activityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityReviewDtoImplCopyWith<_$ActivityReviewDtoImpl> get copyWith =>
      __$$ActivityReviewDtoImplCopyWithImpl<_$ActivityReviewDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityReviewDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityReviewDto implements ActivityReviewDto {
  factory _ActivityReviewDto(
      {required final String comment,
      required final String activityId}) = _$ActivityReviewDtoImpl;

  factory _ActivityReviewDto.fromJson(Map<String, dynamic> json) =
      _$ActivityReviewDtoImpl.fromJson;

  @override
  String get comment;
  @override
  String get activityId;
  @override
  @JsonKey(ignore: true)
  _$$ActivityReviewDtoImplCopyWith<_$ActivityReviewDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
