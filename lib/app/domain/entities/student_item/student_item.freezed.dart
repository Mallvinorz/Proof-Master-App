// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentItem _$StudentItemFromJson(Map<String, dynamic> json) {
  return _StudentItem.fromJson(json);
}

/// @nodoc
mixin _$StudentItem {
  String get name => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentItemCopyWith<StudentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentItemCopyWith<$Res> {
  factory $StudentItemCopyWith(
          StudentItem value, $Res Function(StudentItem) then) =
      _$StudentItemCopyWithImpl<$Res, StudentItem>;
  @useResult
  $Res call({String name, String? route});
}

/// @nodoc
class _$StudentItemCopyWithImpl<$Res, $Val extends StudentItem>
    implements $StudentItemCopyWith<$Res> {
  _$StudentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? route = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentItemImplCopyWith<$Res>
    implements $StudentItemCopyWith<$Res> {
  factory _$$StudentItemImplCopyWith(
          _$StudentItemImpl value, $Res Function(_$StudentItemImpl) then) =
      __$$StudentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? route});
}

/// @nodoc
class __$$StudentItemImplCopyWithImpl<$Res>
    extends _$StudentItemCopyWithImpl<$Res, _$StudentItemImpl>
    implements _$$StudentItemImplCopyWith<$Res> {
  __$$StudentItemImplCopyWithImpl(
      _$StudentItemImpl _value, $Res Function(_$StudentItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? route = freezed,
  }) {
    return _then(_$StudentItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentItemImpl implements _StudentItem {
  const _$StudentItemImpl({required this.name, this.route});

  factory _$StudentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentItemImplFromJson(json);

  @override
  final String name;
  @override
  final String? route;

  @override
  String toString() {
    return 'StudentItem(name: $name, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentItemImplCopyWith<_$StudentItemImpl> get copyWith =>
      __$$StudentItemImplCopyWithImpl<_$StudentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentItemImplToJson(
      this,
    );
  }
}

abstract class _StudentItem implements StudentItem {
  const factory _StudentItem(
      {required final String name, final String? route}) = _$StudentItemImpl;

  factory _StudentItem.fromJson(Map<String, dynamic> json) =
      _$StudentItemImpl.fromJson;

  @override
  String get name;
  @override
  String? get route;
  @override
  @JsonKey(ignore: true)
  _$$StudentItemImplCopyWith<_$StudentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
