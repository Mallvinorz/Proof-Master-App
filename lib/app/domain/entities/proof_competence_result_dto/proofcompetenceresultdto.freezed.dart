// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proofcompetenceresultdto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProofCompetenceResultDto _$ProofCompetenceResultDtoFromJson(
    Map<String, dynamic> json) {
  return _ProofCompetenceResultDto.fromJson(json);
}

/// @nodoc
mixin _$ProofCompetenceResultDto {
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProofCompetenceResultDtoCopyWith<ProofCompetenceResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProofCompetenceResultDtoCopyWith<$Res> {
  factory $ProofCompetenceResultDtoCopyWith(ProofCompetenceResultDto value,
          $Res Function(ProofCompetenceResultDto) then) =
      _$ProofCompetenceResultDtoCopyWithImpl<$Res, ProofCompetenceResultDto>;
  @useResult
  $Res call({int score});
}

/// @nodoc
class _$ProofCompetenceResultDtoCopyWithImpl<$Res,
        $Val extends ProofCompetenceResultDto>
    implements $ProofCompetenceResultDtoCopyWith<$Res> {
  _$ProofCompetenceResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProofCompetenceResultDtoImplCopyWith<$Res>
    implements $ProofCompetenceResultDtoCopyWith<$Res> {
  factory _$$ProofCompetenceResultDtoImplCopyWith(
          _$ProofCompetenceResultDtoImpl value,
          $Res Function(_$ProofCompetenceResultDtoImpl) then) =
      __$$ProofCompetenceResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int score});
}

/// @nodoc
class __$$ProofCompetenceResultDtoImplCopyWithImpl<$Res>
    extends _$ProofCompetenceResultDtoCopyWithImpl<$Res,
        _$ProofCompetenceResultDtoImpl>
    implements _$$ProofCompetenceResultDtoImplCopyWith<$Res> {
  __$$ProofCompetenceResultDtoImplCopyWithImpl(
      _$ProofCompetenceResultDtoImpl _value,
      $Res Function(_$ProofCompetenceResultDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_$ProofCompetenceResultDtoImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProofCompetenceResultDtoImpl implements _ProofCompetenceResultDto {
  _$ProofCompetenceResultDtoImpl({required this.score});

  factory _$ProofCompetenceResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProofCompetenceResultDtoImplFromJson(json);

  @override
  final int score;

  @override
  String toString() {
    return 'ProofCompetenceResultDto(score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProofCompetenceResultDtoImpl &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProofCompetenceResultDtoImplCopyWith<_$ProofCompetenceResultDtoImpl>
      get copyWith => __$$ProofCompetenceResultDtoImplCopyWithImpl<
          _$ProofCompetenceResultDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProofCompetenceResultDtoImplToJson(
      this,
    );
  }
}

abstract class _ProofCompetenceResultDto implements ProofCompetenceResultDto {
  factory _ProofCompetenceResultDto({required final int score}) =
      _$ProofCompetenceResultDtoImpl;

  factory _ProofCompetenceResultDto.fromJson(Map<String, dynamic> json) =
      _$ProofCompetenceResultDtoImpl.fromJson;

  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$ProofCompetenceResultDtoImplCopyWith<_$ProofCompetenceResultDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
