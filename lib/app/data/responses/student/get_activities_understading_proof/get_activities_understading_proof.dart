import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetActivitiesUnderstadingProof extends Equatable {
  final Data? data;

  const GetActivitiesUnderstadingProof({this.data});

  factory GetActivitiesUnderstadingProof.fromMap(Map<String, dynamic> data) {
    return GetActivitiesUnderstadingProof(
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
  /// Parses the string and returns the resulting Json object as [GetActivitiesUnderstadingProof].
  factory GetActivitiesUnderstadingProof.fromJson(String data) {
    return GetActivitiesUnderstadingProof.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetActivitiesUnderstadingProof] to a JSON string.
  String toJson() => json.encode(toMap());

  GetActivitiesUnderstadingProof copyWith({
    Data? data,
  }) {
    return GetActivitiesUnderstadingProof(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
