import 'dart:convert';

import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final String? id;
  final String? title;
  final int? finishedProgress;

  const Report({this.id, this.title, this.finishedProgress});

  factory Report.fromMap(Map<String, dynamic> data) => Report(
        id: data['id'] as String?,
        title: data['title'] as String?,
        finishedProgress: data['finished_progress'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'finished_progress': finishedProgress,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Report].
  factory Report.fromJson(String data) {
    return Report.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Report] to a JSON string.
  String toJson() => json.encode(toMap());

  Report copyWith({
    String? id,
    String? title,
    int? finishedProgress,
  }) {
    return Report(
      id: id ?? this.id,
      title: title ?? this.title,
      finishedProgress: finishedProgress ?? this.finishedProgress,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, finishedProgress];
}
