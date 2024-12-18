import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class UploadFileActivityResponse extends Equatable {
  final Data? data;
  final String? message;

  const UploadFileActivityResponse({this.data, this.message});

  factory UploadFileActivityResponse.fromMap(Map<String, dynamic> data) {
    return UploadFileActivityResponse(
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UploadFileActivityResponse].
  factory UploadFileActivityResponse.fromJson(String data) {
    return UploadFileActivityResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UploadFileActivityResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  UploadFileActivityResponse copyWith({
    Data? data,
    String? message,
  }) {
    return UploadFileActivityResponse(
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, message];
}
