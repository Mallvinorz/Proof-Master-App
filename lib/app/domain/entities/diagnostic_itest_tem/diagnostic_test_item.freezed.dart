// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic_test_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiagnosticTestItem _$DiagnosticTestItemFromJson(Map<String, dynamic> json) {
  return _DiagnosticTestItem.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticTestItem {
  String get route => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosticTestItemCopyWith<DiagnosticTestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticTestItemCopyWith<$Res> {
  factory $DiagnosticTestItemCopyWith(
          DiagnosticTestItem value, $Res Function(DiagnosticTestItem) then) =
      _$DiagnosticTestItemCopyWithImpl<$Res, DiagnosticTestItem>;
  @useResult
  $Res call({String route, String text, String? iconUrl});
}

/// @nodoc
class _$DiagnosticTestItemCopyWithImpl<$Res, $Val extends DiagnosticTestItem>
    implements $DiagnosticTestItemCopyWith<$Res> {
  _$DiagnosticTestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? text = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiagnosticTestItemImplCopyWith<$Res>
    implements $DiagnosticTestItemCopyWith<$Res> {
  factory _$$DiagnosticTestItemImplCopyWith(_$DiagnosticTestItemImpl value,
          $Res Function(_$DiagnosticTestItemImpl) then) =
      __$$DiagnosticTestItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route, String text, String? iconUrl});
}

/// @nodoc
class __$$DiagnosticTestItemImplCopyWithImpl<$Res>
    extends _$DiagnosticTestItemCopyWithImpl<$Res, _$DiagnosticTestItemImpl>
    implements _$$DiagnosticTestItemImplCopyWith<$Res> {
  __$$DiagnosticTestItemImplCopyWithImpl(_$DiagnosticTestItemImpl _value,
      $Res Function(_$DiagnosticTestItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? text = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_$DiagnosticTestItemImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticTestItemImpl implements _DiagnosticTestItem {
  _$DiagnosticTestItemImpl(
      {required this.route, required this.text, this.iconUrl});

  factory _$DiagnosticTestItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticTestItemImplFromJson(json);

  @override
  final String route;
  @override
  final String text;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'DiagnosticTestItem(route: $route, text: $text, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticTestItemImpl &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, route, text, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticTestItemImplCopyWith<_$DiagnosticTestItemImpl> get copyWith =>
      __$$DiagnosticTestItemImplCopyWithImpl<_$DiagnosticTestItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticTestItemImplToJson(
      this,
    );
  }
}

abstract class _DiagnosticTestItem implements DiagnosticTestItem {
  factory _DiagnosticTestItem(
      {required final String route,
      required final String text,
      final String? iconUrl}) = _$DiagnosticTestItemImpl;

  factory _DiagnosticTestItem.fromJson(Map<String, dynamic> json) =
      _$DiagnosticTestItemImpl.fromJson;

  @override
  String get route;
  @override
  String get text;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$DiagnosticTestItemImplCopyWith<_$DiagnosticTestItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
