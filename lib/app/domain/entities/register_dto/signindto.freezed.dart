// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signindto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SIgninDTO _$SIgninDTOFromJson(Map<String, dynamic> json) {
  return _SIgninDTO.fromJson(json);
}

/// @nodoc
mixin _$SIgninDTO {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SIgninDTOCopyWith<SIgninDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SIgninDTOCopyWith<$Res> {
  factory $SIgninDTOCopyWith(SIgninDTO value, $Res Function(SIgninDTO) then) =
      _$SIgninDTOCopyWithImpl<$Res, SIgninDTO>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SIgninDTOCopyWithImpl<$Res, $Val extends SIgninDTO>
    implements $SIgninDTOCopyWith<$Res> {
  _$SIgninDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SIgninDTOImplCopyWith<$Res>
    implements $SIgninDTOCopyWith<$Res> {
  factory _$$SIgninDTOImplCopyWith(
          _$SIgninDTOImpl value, $Res Function(_$SIgninDTOImpl) then) =
      __$$SIgninDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SIgninDTOImplCopyWithImpl<$Res>
    extends _$SIgninDTOCopyWithImpl<$Res, _$SIgninDTOImpl>
    implements _$$SIgninDTOImplCopyWith<$Res> {
  __$$SIgninDTOImplCopyWithImpl(
      _$SIgninDTOImpl _value, $Res Function(_$SIgninDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SIgninDTOImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SIgninDTOImpl implements _SIgninDTO {
  _$SIgninDTOImpl({required this.email, required this.password});

  factory _$SIgninDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SIgninDTOImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SIgninDTO(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SIgninDTOImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SIgninDTOImplCopyWith<_$SIgninDTOImpl> get copyWith =>
      __$$SIgninDTOImplCopyWithImpl<_$SIgninDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SIgninDTOImplToJson(
      this,
    );
  }
}

abstract class _SIgninDTO implements SIgninDTO {
  factory _SIgninDTO(
      {required final String email,
      required final String password}) = _$SIgninDTOImpl;

  factory _SIgninDTO.fromJson(Map<String, dynamic> json) =
      _$SIgninDTOImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SIgninDTOImplCopyWith<_$SIgninDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
