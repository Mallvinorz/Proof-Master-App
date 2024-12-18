import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'activity.dart';

class Data extends Equatable {
  final List<Activity>? activities;

  const Data({this.activities});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        activities: (data['activities'] as List<dynamic>?)
            ?.map((e) => Activity.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'activities': activities?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    List<Activity>? activities,
  }) {
    return Data(
      activities: activities ?? this.activities,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [activities];
}
