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
  return _DashboardItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  bool get isSeparator => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get separatorText => throw _privateConstructorUsedError;
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
abstract class _$$DashboardItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$DashboardItemImplCopyWith(
          _$DashboardItemImpl value, $Res Function(_$DashboardItemImpl) then) =
      __$$DashboardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSeparator,
      String? iconUrl,
      String? separatorText,
      LearningMaterial? learningMaterial});

  @override
  $LearningMaterialCopyWith<$Res>? get learningMaterial;
}

/// @nodoc
class __$$DashboardItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$DashboardItemImpl>
    implements _$$DashboardItemImplCopyWith<$Res> {
  __$$DashboardItemImplCopyWithImpl(
      _$DashboardItemImpl _value, $Res Function(_$DashboardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeparator = null,
    Object? iconUrl = freezed,
    Object? separatorText = freezed,
    Object? learningMaterial = freezed,
  }) {
    return _then(_$DashboardItemImpl(
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
      learningMaterial: freezed == learningMaterial
          ? _value.learningMaterial
          : learningMaterial // ignore: cast_nullable_to_non_nullable
              as LearningMaterial?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardItemImpl
    with DiagnosticableTreeMixin
    implements _DashboardItem {
  const _$DashboardItemImpl(
      {required this.isSeparator,
      this.iconUrl,
      this.separatorText,
      this.learningMaterial});

  factory _$DashboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardItemImplFromJson(json);

  @override
  final bool isSeparator;
  @override
  final String? iconUrl;
  @override
  final String? separatorText;
  @override
  final LearningMaterial? learningMaterial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuItem(isSeparator: $isSeparator, iconUrl: $iconUrl, separatorText: $separatorText, learningMaterial: $learningMaterial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MenuItem'))
      ..add(DiagnosticsProperty('isSeparator', isSeparator))
      ..add(DiagnosticsProperty('iconUrl', iconUrl))
      ..add(DiagnosticsProperty('separatorText', separatorText))
      ..add(DiagnosticsProperty('learningMaterial', learningMaterial));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardItemImpl &&
            (identical(other.isSeparator, isSeparator) ||
                other.isSeparator == isSeparator) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.separatorText, separatorText) ||
                other.separatorText == separatorText) &&
            (identical(other.learningMaterial, learningMaterial) ||
                other.learningMaterial == learningMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isSeparator, iconUrl, separatorText, learningMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardItemImplCopyWith<_$DashboardItemImpl> get copyWith =>
      __$$DashboardItemImplCopyWithImpl<_$DashboardItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardItemImplToJson(
      this,
    );
  }
}

abstract class _DashboardItem implements MenuItem {
  const factory _DashboardItem(
      {required final bool isSeparator,
      final String? iconUrl,
      final String? separatorText,
      final LearningMaterial? learningMaterial}) = _$DashboardItemImpl;

  factory _DashboardItem.fromJson(Map<String, dynamic> json) =
      _$DashboardItemImpl.fromJson;

  @override
  bool get isSeparator;
  @override
  String? get iconUrl;
  @override
  String? get separatorText;
  @override
  LearningMaterial? get learningMaterial;
  @override
  @JsonKey(ignore: true)
  _$$DashboardItemImplCopyWith<_$DashboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
