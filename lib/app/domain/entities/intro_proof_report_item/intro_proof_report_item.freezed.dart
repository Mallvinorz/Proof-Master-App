// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_proof_report_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IntroProofReportItem _$IntroProofReportItemFromJson(Map<String, dynamic> json) {
  return _IntroProofReportItem.fromJson(json);
}

/// @nodoc
mixin _$IntroProofReportItem {
  String get text => throw _privateConstructorUsedError;
  int get finishedCount => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntroProofReportItemCopyWith<IntroProofReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroProofReportItemCopyWith<$Res> {
  factory $IntroProofReportItemCopyWith(IntroProofReportItem value,
          $Res Function(IntroProofReportItem) then) =
      _$IntroProofReportItemCopyWithImpl<$Res, IntroProofReportItem>;
  @useResult
  $Res call({String text, int finishedCount, int totalCount});
}

/// @nodoc
class _$IntroProofReportItemCopyWithImpl<$Res,
        $Val extends IntroProofReportItem>
    implements $IntroProofReportItemCopyWith<$Res> {
  _$IntroProofReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? finishedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      finishedCount: null == finishedCount
          ? _value.finishedCount
          : finishedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroProofReportItemImplCopyWith<$Res>
    implements $IntroProofReportItemCopyWith<$Res> {
  factory _$$IntroProofReportItemImplCopyWith(_$IntroProofReportItemImpl value,
          $Res Function(_$IntroProofReportItemImpl) then) =
      __$$IntroProofReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int finishedCount, int totalCount});
}

/// @nodoc
class __$$IntroProofReportItemImplCopyWithImpl<$Res>
    extends _$IntroProofReportItemCopyWithImpl<$Res, _$IntroProofReportItemImpl>
    implements _$$IntroProofReportItemImplCopyWith<$Res> {
  __$$IntroProofReportItemImplCopyWithImpl(_$IntroProofReportItemImpl _value,
      $Res Function(_$IntroProofReportItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? finishedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$IntroProofReportItemImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      finishedCount: null == finishedCount
          ? _value.finishedCount
          : finishedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntroProofReportItemImpl implements _IntroProofReportItem {
  _$IntroProofReportItemImpl(
      {required this.text,
      required this.finishedCount,
      required this.totalCount});

  factory _$IntroProofReportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntroProofReportItemImplFromJson(json);

  @override
  final String text;
  @override
  final int finishedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'IntroProofReportItem(text: $text, finishedCount: $finishedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroProofReportItemImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.finishedCount, finishedCount) ||
                other.finishedCount == finishedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, finishedCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroProofReportItemImplCopyWith<_$IntroProofReportItemImpl>
      get copyWith =>
          __$$IntroProofReportItemImplCopyWithImpl<_$IntroProofReportItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntroProofReportItemImplToJson(
      this,
    );
  }
}

abstract class _IntroProofReportItem implements IntroProofReportItem {
  factory _IntroProofReportItem(
      {required final String text,
      required final int finishedCount,
      required final int totalCount}) = _$IntroProofReportItemImpl;

  factory _IntroProofReportItem.fromJson(Map<String, dynamic> json) =
      _$IntroProofReportItemImpl.fromJson;

  @override
  String get text;
  @override
  int get finishedCount;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$IntroProofReportItemImplCopyWith<_$IntroProofReportItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
