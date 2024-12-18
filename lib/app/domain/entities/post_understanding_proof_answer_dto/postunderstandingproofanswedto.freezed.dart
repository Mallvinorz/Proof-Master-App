// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postunderstandingproofanswedto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostUnderstandingProofAnsweDto {
  File get pdfFile => throw _privateConstructorUsedError;
  String get activityId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostUnderstandingProofAnsweDtoCopyWith<PostUnderstandingProofAnsweDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUnderstandingProofAnsweDtoCopyWith<$Res> {
  factory $PostUnderstandingProofAnsweDtoCopyWith(
          PostUnderstandingProofAnsweDto value,
          $Res Function(PostUnderstandingProofAnsweDto) then) =
      _$PostUnderstandingProofAnsweDtoCopyWithImpl<$Res,
          PostUnderstandingProofAnsweDto>;
  @useResult
  $Res call({File pdfFile, String activityId});
}

/// @nodoc
class _$PostUnderstandingProofAnsweDtoCopyWithImpl<$Res,
        $Val extends PostUnderstandingProofAnsweDto>
    implements $PostUnderstandingProofAnsweDtoCopyWith<$Res> {
  _$PostUnderstandingProofAnsweDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfFile = null,
    Object? activityId = null,
  }) {
    return _then(_value.copyWith(
      pdfFile: null == pdfFile
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as File,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUnderstandingProofAnsweDtoImplCopyWith<$Res>
    implements $PostUnderstandingProofAnsweDtoCopyWith<$Res> {
  factory _$$PostUnderstandingProofAnsweDtoImplCopyWith(
          _$PostUnderstandingProofAnsweDtoImpl value,
          $Res Function(_$PostUnderstandingProofAnsweDtoImpl) then) =
      __$$PostUnderstandingProofAnsweDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File pdfFile, String activityId});
}

/// @nodoc
class __$$PostUnderstandingProofAnsweDtoImplCopyWithImpl<$Res>
    extends _$PostUnderstandingProofAnsweDtoCopyWithImpl<$Res,
        _$PostUnderstandingProofAnsweDtoImpl>
    implements _$$PostUnderstandingProofAnsweDtoImplCopyWith<$Res> {
  __$$PostUnderstandingProofAnsweDtoImplCopyWithImpl(
      _$PostUnderstandingProofAnsweDtoImpl _value,
      $Res Function(_$PostUnderstandingProofAnsweDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfFile = null,
    Object? activityId = null,
  }) {
    return _then(_$PostUnderstandingProofAnsweDtoImpl(
      pdfFile: null == pdfFile
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as File,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostUnderstandingProofAnsweDtoImpl
    implements _PostUnderstandingProofAnsweDto {
  _$PostUnderstandingProofAnsweDtoImpl(
      {required this.pdfFile, required this.activityId});

  @override
  final File pdfFile;
  @override
  final String activityId;

  @override
  String toString() {
    return 'PostUnderstandingProofAnsweDto(pdfFile: $pdfFile, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUnderstandingProofAnsweDtoImpl &&
            (identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pdfFile, activityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUnderstandingProofAnsweDtoImplCopyWith<
          _$PostUnderstandingProofAnsweDtoImpl>
      get copyWith => __$$PostUnderstandingProofAnsweDtoImplCopyWithImpl<
          _$PostUnderstandingProofAnsweDtoImpl>(this, _$identity);
}

abstract class _PostUnderstandingProofAnsweDto
    implements PostUnderstandingProofAnsweDto {
  factory _PostUnderstandingProofAnsweDto(
      {required final File pdfFile,
      required final String activityId}) = _$PostUnderstandingProofAnsweDtoImpl;

  @override
  File get pdfFile;
  @override
  String get activityId;
  @override
  @JsonKey(ignore: true)
  _$$PostUnderstandingProofAnsweDtoImplCopyWith<
          _$PostUnderstandingProofAnsweDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
