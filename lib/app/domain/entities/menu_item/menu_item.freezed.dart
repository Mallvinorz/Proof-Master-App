// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  bool get isSeparator => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get separatorText => throw _privateConstructorUsedError;
  String? get menuText => throw _privateConstructorUsedError;
  String? get menuDesc => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  LearningMaterial? get learningMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call(
      {bool isSeparator,
      String? iconUrl,
      String? separatorText,
      String? menuText,
      String? menuDesc,
      String? route,
      LearningMaterial? learningMaterial});

  $LearningMaterialCopyWith<$Res>? get learningMaterial;
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeparator = null,
    Object? iconUrl = freezed,
    Object? separatorText = freezed,
    Object? menuText = freezed,
    Object? menuDesc = freezed,
    Object? route = freezed,
    Object? learningMaterial = freezed,
  }) {
    return _then(_value.copyWith(
      isSeparator: null == isSeparator
          ? _value.isSeparator
          : isSeparator // ignore: cast_nullable_to_non_nullable
              as bool,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      separatorText: freezed == separatorText
          ? _value.separatorText
          : separatorText // ignore: cast_nullable_to_non_nullable
              as String?,
      menuText: freezed == menuText
          ? _value.menuText
          : menuText // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      learningMaterial: freezed == learningMaterial
          ? _value.learningMaterial
          : learningMaterial // ignore: cast_nullable_to_non_nullable
              as LearningMaterial?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LearningMaterialCopyWith<$Res>? get learningMaterial {
    if (_value.learningMaterial == null) {
      return null;
    }

    return $LearningMaterialCopyWith<$Res>(_value.learningMaterial!, (value) {
      return _then(_value.copyWith(learningMaterial: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
          _$MenuItemImpl value, $Res Function(_$MenuItemImpl) then) =
      __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSeparator,
      String? iconUrl,
      String? separatorText,
      String? menuText,
      String? menuDesc,
      String? route,
      LearningMaterial? learningMaterial});

  @override
  $LearningMaterialCopyWith<$Res>? get learningMaterial;
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
      _$MenuItemImpl _value, $Res Function(_$MenuItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeparator = null,
    Object? iconUrl = freezed,
    Object? separatorText = freezed,
    Object? menuText = freezed,
    Object? menuDesc = freezed,
    Object? route = freezed,
    Object? learningMaterial = freezed,
  }) {
    return _then(_$MenuItemImpl(
      isSeparator: null == isSeparator
          ? _value.isSeparator
          : isSeparator // ignore: cast_nullable_to_non_nullable
              as bool,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      separatorText: freezed == separatorText
          ? _value.separatorText
          : separatorText // ignore: cast_nullable_to_non_nullable
              as String?,
      menuText: freezed == menuText
          ? _value.menuText
          : menuText // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      learningMaterial: freezed == learningMaterial
          ? _value.learningMaterial
          : learningMaterial // ignore: cast_nullable_to_non_nullable
              as LearningMaterial?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl with DiagnosticableTreeMixin implements _MenuItem {
  const _$MenuItemImpl(
      {required this.isSeparator,
      this.iconUrl,
      this.separatorText,
      this.menuText,
      this.menuDesc,
      this.route,
      this.learningMaterial});

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  final bool isSeparator;
  @override
  final String? iconUrl;
  @override
  final String? separatorText;
  @override
  final String? menuText;
  @override
  final String? menuDesc;
  @override
  final String? route;
  @override
  final LearningMaterial? learningMaterial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuItem(isSeparator: $isSeparator, iconUrl: $iconUrl, separatorText: $separatorText, menuText: $menuText, menuDesc: $menuDesc, route: $route, learningMaterial: $learningMaterial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MenuItem'))
      ..add(DiagnosticsProperty('isSeparator', isSeparator))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('separatorText', separatorText))
      ..add(DiagnosticsProperty('menuText', menuText))
      ..add(DiagnosticsProperty('menuDesc', menuDesc))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('learningMaterial', learningMaterial));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.isSeparator, isSeparator) ||
                other.isSeparator == isSeparator) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.separatorText, separatorText) ||
                other.separatorText == separatorText) &&
            (identical(other.menuText, menuText) ||
                other.menuText == menuText) &&
            (identical(other.menuDesc, menuDesc) ||
                other.menuDesc == menuDesc) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.learningMaterial, learningMaterial) ||
                other.learningMaterial == learningMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSeparator, iconUrl,
      separatorText, menuText, menuDesc, route, learningMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(
      this,
    );
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem(
      {required final bool isSeparator,
      final String? iconUrl,
      final String? separatorText,
      final String? menuText,
      final String? menuDesc,
      final String? route,
      final LearningMaterial? learningMaterial}) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  bool get isSeparator;
  @override
  String? get iconUrl;
  @override
  String? get separatorText;
  @override
  String? get menuText;
  @override
  String? get menuDesc;
  @override
  String? get route;
  @override
  LearningMaterial? get learningMaterial;
  @override
  @JsonKey(ignore: true)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
