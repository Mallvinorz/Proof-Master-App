// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosticquizresultdto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiagnosticQuizResultDto _$DiagnosticQuizResultDtoFromJson(
    Map<String, dynamic> json) {
  return _DiagnosticQuizResultDto.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticQuizResultDto {
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosticQuizResultDtoCopyWith<DiagnosticQuizResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticQuizResultDtoCopyWith<$Res> {
  factory $DiagnosticQuizResultDtoCopyWith(DiagnosticQuizResultDto value,
          $Res Function(DiagnosticQuizResultDto) then) =
      _$DiagnosticQuizResultDtoCopyWithImpl<$Res, DiagnosticQuizResultDto>;
  @useResult
  $Res call({String result});
}

/// @nodoc
class _$DiagnosticQuizResultDtoCopyWithImpl<$Res,
        $Val extends DiagnosticQuizResultDto>
    implements $DiagnosticQuizResultDtoCopyWith<$Res> {
  _$DiagnosticQuizResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticQuizResultDtoImplCopyWith<$Res>
    implements $DiagnosticQuizResultDtoCopyWith<$Res> {
  factory _$$DiagnosticQuizResultDtoImplCopyWith(
          _$DiagnosticQuizResultDtoImpl value,
          $Res Function(_$DiagnosticQuizResultDtoImpl) then) =
      __$$DiagnosticQuizResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result});
}

/// @nodoc
class __$$DiagnosticQuizResultDtoImplCopyWithImpl<$Res>
    extends _$DiagnosticQuizResultDtoCopyWithImpl<$Res,
        _$DiagnosticQuizResultDtoImpl>
    implements _$$DiagnosticQuizResultDtoImplCopyWith<$Res> {
  __$$DiagnosticQuizResultDtoImplCopyWithImpl(
      _$DiagnosticQuizResultDtoImpl _value,
      $Res Function(_$DiagnosticQuizResultDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$DiagnosticQuizResultDtoImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticQuizResultDtoImpl implements _DiagnosticQuizResultDto {
  _$DiagnosticQuizResultDtoImpl({required this.result});

  factory _$DiagnosticQuizResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticQuizResultDtoImplFromJson(json);

  @override
  final String result;

  @override
  String toString() {
    return 'DiagnosticQuizResultDto(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticQuizResultDtoImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticQuizResultDtoImplCopyWith<_$DiagnosticQuizResultDtoImpl>
      get copyWith => __$$DiagnosticQuizResultDtoImplCopyWithImpl<
          _$DiagnosticQuizResultDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticQuizResultDtoImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticQuizResultDto implements DiagnosticQuizResultDto {
  factory _DiagnosticQuizResultDto({required final String result}) =
      _$DiagnosticQuizResultDtoImpl;

  factory _DiagnosticQuizResultDto.fromJson(Map<String, dynamic> json) =
      _$DiagnosticQuizResultDtoImpl.fromJson;

  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$DiagnosticQuizResultDtoImplCopyWith<_$DiagnosticQuizResultDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
