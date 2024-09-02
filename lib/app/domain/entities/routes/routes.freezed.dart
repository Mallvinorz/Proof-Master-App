// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Routes {
  String get route => throw _privateConstructorUsedError;
  Widget get child => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutesCopyWith<Routes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesCopyWith<$Res> {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) then) =
      _$RoutesCopyWithImpl<$Res, Routes>;
  @useResult
  $Res call({String route, Widget child});
}

/// @nodoc
class _$RoutesCopyWithImpl<$Res, $Val extends Routes>
    implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? child = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutesImplCopyWith<$Res> implements $RoutesCopyWith<$Res> {
  factory _$$RoutesImplCopyWith(
          _$RoutesImpl value, $Res Function(_$RoutesImpl) then) =
      __$$RoutesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route, Widget child});
}

/// @nodoc
class __$$RoutesImplCopyWithImpl<$Res>
    extends _$RoutesCopyWithImpl<$Res, _$RoutesImpl>
    implements _$$RoutesImplCopyWith<$Res> {
  __$$RoutesImplCopyWithImpl(
      _$RoutesImpl _value, $Res Function(_$RoutesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? child = null,
  }) {
    return _then(_$RoutesImpl(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$RoutesImpl implements _Routes {
  _$RoutesImpl({required this.route, required this.child});

  @override
  final String route;
  @override
  final Widget child;

  @override
  String toString() {
    return 'Routes(route: $route, child: $child)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutesImpl &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutesImplCopyWith<_$RoutesImpl> get copyWith =>
      __$$RoutesImplCopyWithImpl<_$RoutesImpl>(this, _$identity);
}

abstract class _Routes implements Routes {
  factory _Routes({required final String route, required final Widget child}) =
      _$RoutesImpl;

  @override
  String get route;
  @override
  Widget get child;
  @override
  @JsonKey(ignore: true)
  _$$RoutesImplCopyWith<_$RoutesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
