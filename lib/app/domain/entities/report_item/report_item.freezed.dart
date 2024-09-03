// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportItem _$ReportItemFromJson(Map<String, dynamic> json) {
  return _ReportItem.fromJson(json);
}

/// @nodoc
mixin _$ReportItem {
  String get route => throw _privateConstructorUsedError;
  String get textTitle => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportItemCopyWith<ReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportItemCopyWith<$Res> {
  factory $ReportItemCopyWith(
          ReportItem value, $Res Function(ReportItem) then) =
      _$ReportItemCopyWithImpl<$Res, ReportItem>;
  @useResult
  $Res call({String route, String textTitle, double progress});
}

/// @nodoc
class _$ReportItemCopyWithImpl<$Res, $Val extends ReportItem>
    implements $ReportItemCopyWith<$Res> {
  _$ReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? textTitle = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportItemImplCopyWith<$Res>
    implements $ReportItemCopyWith<$Res> {
  factory _$$ReportItemImplCopyWith(
          _$ReportItemImpl value, $Res Function(_$ReportItemImpl) then) =
      __$$ReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route, String textTitle, double progress});
}

/// @nodoc
class __$$ReportItemImplCopyWithImpl<$Res>
    extends _$ReportItemCopyWithImpl<$Res, _$ReportItemImpl>
    implements _$$ReportItemImplCopyWith<$Res> {
  __$$ReportItemImplCopyWithImpl(
      _$ReportItemImpl _value, $Res Function(_$ReportItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? textTitle = null,
    Object? progress = null,
  }) {
    return _then(_$ReportItemImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportItemImpl implements _ReportItem {
  _$ReportItemImpl(
      {required this.route, required this.textTitle, required this.progress});

  factory _$ReportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportItemImplFromJson(json);

  @override
  final String route;
  @override
  final String textTitle;
  @override
  final double progress;

  @override
  String toString() {
    return 'ReportItem(route: $route, textTitle: $textTitle, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportItemImpl &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.textTitle, textTitle) ||
                other.textTitle == textTitle) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, route, textTitle, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportItemImplCopyWith<_$ReportItemImpl> get copyWith =>
      __$$ReportItemImplCopyWithImpl<_$ReportItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportItemImplToJson(
      this,
    );
  }
}

abstract class _ReportItem implements ReportItem {
  factory _ReportItem(
      {required final String route,
      required final String textTitle,
      required final double progress}) = _$ReportItemImpl;

  factory _ReportItem.fromJson(Map<String, dynamic> json) =
      _$ReportItemImpl.fromJson;

  @override
  String get route;
  @override
  String get textTitle;
  @override
  double get progress;
  @override
  @JsonKey(ignore: true)
  _$$ReportItemImplCopyWith<_$ReportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
