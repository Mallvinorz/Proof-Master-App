import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? id;
  final String? title;
  final String? icUrl;
  final String? desc;
  final String? pdfUrl;

  const Datum({this.id, this.title, this.icUrl, this.desc, this.pdfUrl});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        title: data['title'] as String?,
        icUrl: data['ic_url'] as String?,
        desc: data['description'] as String?,
        pdfUrl: data['pdf_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'ic_url': icUrl,
        'description': desc,
        'pdf_url': pdfUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    String? id,
    String? title,
    String? icUrl,
    String? desc,
    String? pdfUrl,
  }) {
    return Datum(
      id: id ?? this.id,
      title: title ?? this.title,
      icUrl: icUrl ?? this.icUrl,
      desc: desc ?? this.desc,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, icUrl, desc, pdfUrl];
}
