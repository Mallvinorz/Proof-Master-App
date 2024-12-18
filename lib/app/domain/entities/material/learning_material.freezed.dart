// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningMaterial _$LearningMaterialFromJson(Map<String, dynamic> json) {
  return _LearningMaterial.fromJson(json);
}

/// @nodoc
mixin _$LearningMaterial {
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int get totalSubLearningMaterial => throw _privateConstructorUsedError;
  int get finishedSubLearningMaterial => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningMaterialCopyWith<LearningMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningMaterialCopyWith<$Res> {
  factory $LearningMaterialCopyWith(
          LearningMaterial value, $Res Function(LearningMaterial) then) =
      _$LearningMaterialCopyWithImpl<$Res, LearningMaterial>;
  @useResult
  $Res call(
      {String name,
      String desc,
      int totalSubLearningMaterial,
      int finishedSubLearningMaterial,
      bool isLocked});
}

/// @nodoc
class _$LearningMaterialCopyWithImpl<$Res, $Val extends LearningMaterial>
    implements $LearningMaterialCopyWith<$Res> {
  _$LearningMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? totalSubLearningMaterial = null,
    Object? finishedSubLearningMaterial = null,
    Object? isLocked = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      totalSubLearningMaterial: null == totalSubLearningMaterial
          ? _value.totalSubLearningMaterial
          : totalSubLearningMaterial // ignore: cast_nullable_to_non_nullable
              as int,
      finishedSubLearningMaterial: null == finishedSubLearningMaterial
          ? _value.finishedSubLearningMaterial
          : finishedSubLearningMaterial // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningMaterialImplCopyWith<$Res>
    implements $LearningMaterialCopyWith<$Res> {
  factory _$$LearningMaterialImplCopyWith(_$LearningMaterialImpl value,
          $Res Function(_$LearningMaterialImpl) then) =
      __$$LearningMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String desc,
      int totalSubLearningMaterial,
      int finishedSubLearningMaterial,
      bool isLocked});
}

/// @nodoc
class __$$LearningMaterialImplCopyWithImpl<$Res>
    extends _$LearningMaterialCopyWithImpl<$Res, _$LearningMaterialImpl>
    implements _$$LearningMaterialImplCopyWith<$Res> {
  __$$LearningMaterialImplCopyWithImpl(_$LearningMaterialImpl _value,
      $Res Function(_$LearningMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? totalSubLearningMaterial = null,
    Object? finishedSubLearningMaterial = null,
    Object? isLocked = null,
  }) {
    return _then(_$LearningMaterialImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      totalSubLearningMaterial: null == totalSubLearningMaterial
          ? _value.totalSubLearningMaterial
          : totalSubLearningMaterial // ignore: cast_nullable_to_non_nullable
              as int,
      finishedSubLearningMaterial: null == finishedSubLearningMaterial
          ? _value.finishedSubLearningMaterial
          : finishedSubLearningMaterial // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningMaterialImpl implements _LearningMaterial {
  _$LearningMaterialImpl(
      {required this.name,
      required this.desc,
      required this.totalSubLearningMaterial,
      required this.finishedSubLearningMaterial,
      required this.isLocked});

  factory _$LearningMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningMaterialImplFromJson(json);

  @override
  final String name;
  @override
  final String desc;
  @override
  final int totalSubLearningMaterial;
  @override
  final int finishedSubLearningMaterial;
  @override
  final bool isLocked;

  @override
  String toString() {
    return 'LearningMaterial(name: $name, desc: $desc, totalSubLearningMaterial: $totalSubLearningMaterial, finishedSubLearningMaterial: $finishedSubLearningMaterial, isLocked: $isLocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningMaterialImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(
                    other.totalSubLearningMaterial, totalSubLearningMaterial) ||
                other.totalSubLearningMaterial == totalSubLearningMaterial) &&
            (identical(other.finishedSubLearningMaterial,
                    finishedSubLearningMaterial) ||
                other.finishedSubLearningMaterial ==
                    finishedSubLearningMaterial) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, desc,
      totalSubLearningMaterial, finishedSubLearningMaterial, isLocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningMaterialImplCopyWith<_$LearningMaterialImpl> get copyWith =>
      __$$LearningMaterialImplCopyWithImpl<_$LearningMaterialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningMaterialImplToJson(
      this,
    );
  }
}

abstract class _LearningMaterial implements LearningMaterial {
  factory _LearningMaterial(
      {required final String name,
      required final String desc,
      required final int totalSubLearningMaterial,
      required final int finishedSubLearningMaterial,
      required final bool isLocked}) = _$LearningMaterialImpl;

  factory _LearningMaterial.fromJson(Map<String, dynamic> json) =
      _$LearningMaterialImpl.fromJson;

  @override
  String get name;
  @override
  String get desc;
  @override
  int get totalSubLearningMaterial;
  @override
  int get finishedSubLearningMaterial;
  @override
  bool get isLocked;
  @override
  @JsonKey(ignore: true)
  _$$LearningMaterialImplCopyWith<_$LearningMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
