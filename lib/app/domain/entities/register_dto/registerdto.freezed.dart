// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registerdto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterDTO _$RegisterDTOFromJson(Map<String, dynamic> json) {
  return _RegisterDTO.fromJson(json);
}

/// @nodoc
mixin _$RegisterDTO {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get nim => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterDTOCopyWith<RegisterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDTOCopyWith<$Res> {
  factory $RegisterDTOCopyWith(
          RegisterDTO value, $Res Function(RegisterDTO) then) =
      _$RegisterDTOCopyWithImpl<$Res, RegisterDTO>;
  @useResult
  $Res call({String email, String password, String nim, String name});
}

/// @nodoc
class _$RegisterDTOCopyWithImpl<$Res, $Val extends RegisterDTO>
    implements $RegisterDTOCopyWith<$Res> {
  _$RegisterDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? nim = null,
    Object? name = null,
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
      nim: null == nim
          ? _value.nim
          : nim // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterDTOImplCopyWith<$Res>
    implements $RegisterDTOCopyWith<$Res> {
  factory _$$RegisterDTOImplCopyWith(
          _$RegisterDTOImpl value, $Res Function(_$RegisterDTOImpl) then) =
      __$$RegisterDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String nim, String name});
}

/// @nodoc
class __$$RegisterDTOImplCopyWithImpl<$Res>
    extends _$RegisterDTOCopyWithImpl<$Res, _$RegisterDTOImpl>
    implements _$$RegisterDTOImplCopyWith<$Res> {
  __$$RegisterDTOImplCopyWithImpl(
      _$RegisterDTOImpl _value, $Res Function(_$RegisterDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? nim = null,
    Object? name = null,
  }) {
    return _then(_$RegisterDTOImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      nim: null == nim
          ? _value.nim
          : nim // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterDTOImpl implements _RegisterDTO {
  _$RegisterDTOImpl(
      {required this.email,
      required this.password,
      required this.nim,
      required this.name});

  factory _$RegisterDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDTOImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String nim;
  @override
  final String name;

  @override
  String toString() {
    return 'RegisterDTO(email: $email, password: $password, nim: $nim, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDTOImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.nim, nim) || other.nim == nim) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, nim, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDTOImplCopyWith<_$RegisterDTOImpl> get copyWith =>
      __$$RegisterDTOImplCopyWithImpl<_$RegisterDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDTOImplToJson(
      this,
    );
  }
}

abstract class _RegisterDTO implements RegisterDTO {
  factory _RegisterDTO(
      {required final String email,
      required final String password,
      required final String nim,
      required final String name}) = _$RegisterDTOImpl;

  factory _RegisterDTO.fromJson(Map<String, dynamic> json) =
      _$RegisterDTOImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get nim;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RegisterDTOImplCopyWith<_$RegisterDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
