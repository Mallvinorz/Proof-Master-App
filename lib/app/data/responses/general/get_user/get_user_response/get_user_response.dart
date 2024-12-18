import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetUserResponse extends Equatable {
  final Data? data;

  const GetUserResponse({this.data});

  factory GetUserResponse.fromMap(Map<String, dynamic> data) {
    return GetUserResponse(
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
  /// Parses the string and returns the resulting Json object as [GetUserResponse].
  factory GetUserResponse.fromJson(String data) {
    return GetUserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetUserResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetUserResponse copyWith({
    Data? data,
  }) {
    return GetUserResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
