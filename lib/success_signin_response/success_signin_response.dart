import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class SuccessSigninResponse extends Equatable {
  final Data? data;

  const SuccessSigninResponse({this.data});

  factory SuccessSigninResponse.fromMap(Map<String, dynamic> data) {
    return SuccessSigninResponse(
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
  /// Parses the string and returns the resulting Json object as [SuccessSigninResponse].
  factory SuccessSigninResponse.fromJson(String data) {
    return SuccessSigninResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SuccessSigninResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  SuccessSigninResponse copyWith({
    Data? data,
  }) {
    return SuccessSigninResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
