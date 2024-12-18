import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? id;
  final String? title;
  final String? pdfUrl;

  const Data({this.id, this.title, this.pdfUrl});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['id'] as String?,
        title: data['title'] as String?,
        pdfUrl: data['pdf_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'pdf_url': pdfUrl,
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
    String? id,
    String? title,
    String? pdfUrl,
  }) {
    return Data(
      id: id ?? this.id,
      title: title ?? this.title,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, pdfUrl];
}
