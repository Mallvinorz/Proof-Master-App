import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetStudentAnsweredActivitiesResponse extends Equatable {
	final List<Datum>? data;

	const GetStudentAnsweredActivitiesResponse({this.data});

	factory GetStudentAnsweredActivitiesResponse.fromMap(Map<String, dynamic> data) {
		return GetStudentAnsweredActivitiesResponse(
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
  /// Parses the string and returns the resulting Json object as [GetStudentAnsweredActivitiesResponse].
	factory GetStudentAnsweredActivitiesResponse.fromJson(String data) {
		return GetStudentAnsweredActivitiesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetStudentAnsweredActivitiesResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	GetStudentAnsweredActivitiesResponse copyWith({
		List<Datum>? data,
	}) {
		return GetStudentAnsweredActivitiesResponse(
			data: data ?? this.data,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [data];
}
