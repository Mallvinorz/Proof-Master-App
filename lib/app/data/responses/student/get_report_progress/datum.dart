import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? endpoint;
  final String? title;
  final int? progress;

  const Datum({this.endpoint, this.title, this.progress});

  factory Datum.fromResponse(Map<String, dynamic> data) => Datum(
        endpoint: data['endpoint'] as String?,
        title: data['title'] as String?,
        progress: data['progress'] as int?,
      );

  Map<String, dynamic> toResponse() => {
        'endpoint': endpoint,
        'title': title,
        'progress': progress,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromResponse(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toResponse());

  Datum copyWith({
    String? endpoint,
    String? title,
    int? progress,
  }) {
    return Datum(
      endpoint: endpoint ?? this.endpoint,
      title: title ?? this.title,
      progress: progress ?? this.progress,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [endpoint, title, progress];
}
