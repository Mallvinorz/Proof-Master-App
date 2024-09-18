import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class GetAnsweredActivityFromStudentResponse extends Equatable {
	final Data? data;

	const GetAnsweredActivityFromStudentResponse({this.data});

	factory GetAnsweredActivityFromStudentResponse.fromMap(Map<String, dynamic> data) {
		return GetAnsweredActivityFromStudentResponse(
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
  /// Parses the string and returns the resulting Json object as [GetAnsweredActivityFromStudentResponse].
	factory GetAnsweredActivityFromStudentResponse.fromJson(String data) {
		return GetAnsweredActivityFromStudentResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetAnsweredActivityFromStudentResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	GetAnsweredActivityFromStudentResponse copyWith({
		Data? data,
	}) {
		return GetAnsweredActivityFromStudentResponse(
			data: data ?? this.data,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [data];
}
