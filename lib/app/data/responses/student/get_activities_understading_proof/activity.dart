import 'dart:convert';

import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String? id;
  final String? title;

  const Activity({this.id, this.title});

  factory Activity.fromMap(Map<String, dynamic> data) => Activity(
        id: data['id'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Activity].
  factory Activity.fromJson(String data) {
    return Activity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Activity] to a JSON string.
  String toJson() => json.encode(toMap());

  Activity copyWith({
    String? id,
    String? title,
  }) {
    return Activity(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title];
}
