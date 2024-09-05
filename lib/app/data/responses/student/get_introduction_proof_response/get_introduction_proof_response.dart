import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetIntroductionProofResponse extends Equatable {
  final List<Datum>? data;

  const GetIntroductionProofResponse({this.data});

  factory GetIntroductionProofResponse.fromMap(Map<String, dynamic> data) {
    return GetIntroductionProofResponse(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetIntroductionProofResponse].
  factory GetIntroductionProofResponse.fromJson(String data) {
    return GetIntroductionProofResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetIntroductionProofResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetIntroductionProofResponse copyWith({
    List<Datum>? data,
  }) {
    return GetIntroductionProofResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
