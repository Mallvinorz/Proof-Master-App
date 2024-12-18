import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetProofCompetenceQuizMenus extends Equatable {
  final Data? data;

  const GetProofCompetenceQuizMenus({this.data});

  factory GetProofCompetenceQuizMenus.fromMap(Map<String, dynamic> data) {
    return GetProofCompetenceQuizMenus(
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetProofCompetenceQuizMenus].
  factory GetProofCompetenceQuizMenus.fromJson(String data) {
    return GetProofCompetenceQuizMenus.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetProofCompetenceQuizMenus] to a JSON string.
  String toJson() => json.encode(toMap());

  GetProofCompetenceQuizMenus copyWith({
    Data? data,
  }) {
    return GetProofCompetenceQuizMenus(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
