// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inputtext.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InputText _$InputTextFromJson(Map<String, dynamic> json) {
  return _InputText.fromJson(json);
}

/// @nodoc
mixin _$InputText {
  String get value => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get minLen => throw _privateConstructorUsedError;
  int? get maxLen => throw _privateConstructorUsedError;
  bool? get isRequired => throw _privateConstructorUsedError;
  String? get regexCheck => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InputTextCopyWith<InputText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputTextCopyWith<$Res> {
  factory $InputTextCopyWith(InputText value, $Res Function(InputText) then) =
      _$InputTextCopyWithImpl<$Res, InputText>;
  @useResult
  $Res call(
      {String value,
      String? errorMessage,
      int? minLen,
      int? maxLen,
      bool? isRequired,
      String? regexCheck});
}

/// @nodoc
class _$InputTextCopyWithImpl<$Res, $Val extends InputText>
    implements $InputTextCopyWith<$Res> {
  _$InputTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? errorMessage = freezed,
    Object? minLen = freezed,
    Object? maxLen = freezed,
    Object? isRequired = freezed,
    Object? regexCheck = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      minLen: freezed == minLen
          ? _value.minLen
          : minLen // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLen: freezed == maxLen
          ? _value.maxLen
          : maxLen // ignore: cast_nullable_to_non_nullable
              as int?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      regexCheck: freezed == regexCheck
          ? _value.regexCheck
          : regexCheck // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputTextImplCopyWith<$Res>
    implements $InputTextCopyWith<$Res> {
  factory _$$InputTextImplCopyWith(
          _$InputTextImpl value, $Res Function(_$InputTextImpl) then) =
      __$$InputTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String? errorMessage,
      int? minLen,
      int? maxLen,
      bool? isRequired,
      String? regexCheck});
}

/// @nodoc
class __$$InputTextImplCopyWithImpl<$Res>
    extends _$InputTextCopyWithImpl<$Res, _$InputTextImpl>
    implements _$$InputTextImplCopyWith<$Res> {
  __$$InputTextImplCopyWithImpl(
      _$InputTextImpl _value, $Res Function(_$InputTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? errorMessage = freezed,
    Object? minLen = freezed,
    Object? maxLen = freezed,
    Object? isRequired = freezed,
    Object? regexCheck = freezed,
  }) {
    return _then(_$InputTextImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      minLen: freezed == minLen
          ? _value.minLen
          : minLen // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLen: freezed == maxLen
          ? _value.maxLen
          : maxLen // ignore: cast_nullable_to_non_nullable
              as int?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      regexCheck: freezed == regexCheck
          ? _value.regexCheck
          : regexCheck // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InputTextImpl implements _InputText {
  _$InputTextImpl(
      {required this.value,
      this.errorMessage,
      this.minLen,
      this.maxLen,
      this.isRequired,
      this.regexCheck});

  factory _$InputTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputTextImplFromJson(json);

  @override
  final String value;
  @override
  final String? errorMessage;
  @override
  final int? minLen;
  @override
  final int? maxLen;
  @override
  final bool? isRequired;
  @override
  final String? regexCheck;

  @override
  String toString() {
    return 'InputText(value: $value, errorMessage: $errorMessage, minLen: $minLen, maxLen: $maxLen, isRequired: $isRequired, regexCheck: $regexCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputTextImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.minLen, minLen) || other.minLen == minLen) &&
            (identical(other.maxLen, maxLen) || other.maxLen == maxLen) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.regexCheck, regexCheck) ||
                other.regexCheck == regexCheck));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, value, errorMessage, minLen, maxLen, isRequired, regexCheck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputTextImplCopyWith<_$InputTextImpl> get copyWith =>
      __$$InputTextImplCopyWithImpl<_$InputTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputTextImplToJson(
      this,
    );
  }
}

abstract class _InputText implements InputText {
  factory _InputText(
      {required final String value,
      final String? errorMessage,
      final int? minLen,
      final int? maxLen,
      final bool? isRequired,
      final String? regexCheck}) = _$InputTextImpl;

  factory _InputText.fromJson(Map<String, dynamic> json) =
      _$InputTextImpl.fromJson;

  @override
  String get value;
  @override
  String? get errorMessage;
  @override
  int? get minLen;
  @override
  int? get maxLen;
  @override
  bool? get isRequired;
  @override
  String? get regexCheck;
  @override
  @JsonKey(ignore: true)
  _$$InputTextImplCopyWith<_$InputTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
