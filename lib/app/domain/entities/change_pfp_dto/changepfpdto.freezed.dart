// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changepfpdto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangePfpDto {
  File get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePfpDtoCopyWith<ChangePfpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePfpDtoCopyWith<$Res> {
  factory $ChangePfpDtoCopyWith(
          ChangePfpDto value, $Res Function(ChangePfpDto) then) =
      _$ChangePfpDtoCopyWithImpl<$Res, ChangePfpDto>;
  @useResult
  $Res call({File imageFile});
}

/// @nodoc
class _$ChangePfpDtoCopyWithImpl<$Res, $Val extends ChangePfpDto>
    implements $ChangePfpDtoCopyWith<$Res> {
  _$ChangePfpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = null,
  }) {
    return _then(_value.copyWith(
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePfpDtoImplCopyWith<$Res>
    implements $ChangePfpDtoCopyWith<$Res> {
  factory _$$ChangePfpDtoImplCopyWith(
          _$ChangePfpDtoImpl value, $Res Function(_$ChangePfpDtoImpl) then) =
      __$$ChangePfpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File imageFile});
}

/// @nodoc
class __$$ChangePfpDtoImplCopyWithImpl<$Res>
    extends _$ChangePfpDtoCopyWithImpl<$Res, _$ChangePfpDtoImpl>
    implements _$$ChangePfpDtoImplCopyWith<$Res> {
  __$$ChangePfpDtoImplCopyWithImpl(
      _$ChangePfpDtoImpl _value, $Res Function(_$ChangePfpDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = null,
  }) {
    return _then(_$ChangePfpDtoImpl(
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ChangePfpDtoImpl implements _ChangePfpDto {
  _$ChangePfpDtoImpl({required this.imageFile});

  @override
  final File imageFile;

  @override
  String toString() {
    return 'ChangePfpDto(imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePfpDtoImpl &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePfpDtoImplCopyWith<_$ChangePfpDtoImpl> get copyWith =>
      __$$ChangePfpDtoImplCopyWithImpl<_$ChangePfpDtoImpl>(this, _$identity);
}

abstract class _ChangePfpDto implements ChangePfpDto {
  factory _ChangePfpDto({required final File imageFile}) = _$ChangePfpDtoImpl;

  @override
  File get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$ChangePfpDtoImplCopyWith<_$ChangePfpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
