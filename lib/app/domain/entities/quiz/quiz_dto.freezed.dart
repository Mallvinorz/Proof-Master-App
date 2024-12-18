// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizDTO _$QuizDTOFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$QuizDTO {
  String? get prerequisiteDesc => throw _privateConstructorUsedError;
  String? get prerequisiteImg => throw _privateConstructorUsedError;
  List<QuizQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizDTOCopyWith<QuizDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDTOCopyWith<$Res> {
  factory $QuizDTOCopyWith(QuizDTO value, $Res Function(QuizDTO) then) =
      _$QuizDTOCopyWithImpl<$Res, QuizDTO>;
  @useResult
  $Res call(
      {String? prerequisiteDesc,
      String? prerequisiteImg,
      List<QuizQuestion> questions});
}

/// @nodoc
class _$QuizDTOCopyWithImpl<$Res, $Val extends QuizDTO>
    implements $QuizDTOCopyWith<$Res> {
  _$QuizDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prerequisiteDesc = freezed,
    Object? prerequisiteImg = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      prerequisiteDesc: freezed == prerequisiteDesc
          ? _value.prerequisiteDesc
          : prerequisiteDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisiteImg: freezed == prerequisiteImg
          ? _value.prerequisiteImg
          : prerequisiteImg // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizDTOCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? prerequisiteDesc,
      String? prerequisiteImg,
      List<QuizQuestion> questions});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizDTOCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prerequisiteDesc = freezed,
    Object? prerequisiteImg = freezed,
    Object? questions = null,
  }) {
    return _then(_$QuizImpl(
      prerequisiteDesc: freezed == prerequisiteDesc
          ? _value.prerequisiteDesc
          : prerequisiteDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisiteImg: freezed == prerequisiteImg
          ? _value.prerequisiteImg
          : prerequisiteImg // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl implements _Quiz {
  _$QuizImpl(
      {this.prerequisiteDesc,
      this.prerequisiteImg,
      required final List<QuizQuestion> questions})
      : _questions = questions;

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final String? prerequisiteDesc;
  @override
  final String? prerequisiteImg;
  final List<QuizQuestion> _questions;
  @override
  List<QuizQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizDTO(prerequisiteDesc: $prerequisiteDesc, prerequisiteImg: $prerequisiteImg, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.prerequisiteDesc, prerequisiteDesc) ||
                other.prerequisiteDesc == prerequisiteDesc) &&
            (identical(other.prerequisiteImg, prerequisiteImg) ||
                other.prerequisiteImg == prerequisiteImg) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prerequisiteDesc,
      prerequisiteImg, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements QuizDTO {
  factory _Quiz(
      {final String? prerequisiteDesc,
      final String? prerequisiteImg,
      required final List<QuizQuestion> questions}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  String? get prerequisiteDesc;
  @override
  String? get prerequisiteImg;
  @override
  List<QuizQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
