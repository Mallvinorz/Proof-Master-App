import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetStudentsResponse extends Equatable {
  final Data? data;

  const GetStudentsResponse({this.data});

  factory GetStudentsResponse.fromMap(Map<String, dynamic> data) {
    return GetStudentsResponse(
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
  /// Parses the string and returns the resulting Json object as [GetStudentsResponse].
  factory GetStudentsResponse.fromJson(String data) {
    return GetStudentsResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetStudentsResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetStudentsResponse copyWith({
    Data? data,
  }) {
    return GetStudentsResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
