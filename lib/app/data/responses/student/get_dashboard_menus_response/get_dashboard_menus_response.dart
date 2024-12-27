import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetDashboardMenusResponse extends Equatable {
  final List<Datum>? data;

  const GetDashboardMenusResponse({this.data});

  factory GetDashboardMenusResponse.fromMap(Map<String, dynamic> data) {
    return GetDashboardMenusResponse(
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
  /// Parses the string and returns the resulting Json object as [GetDashboardMenusResponse].
  factory GetDashboardMenusResponse.fromJson(String data) {
    return GetDashboardMenusResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetDashboardMenusResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  GetDashboardMenusResponse copyWith({
    List<Datum>? data,
  }) {
    return GetDashboardMenusResponse(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
