import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? file;
  final String? filesize;

  const Data({this.file, this.filesize});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        file: data['file'] as String?,
        filesize: data['filesize'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'file': file,
        'filesize': filesize,
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
    String? file,
    String? filesize,
  }) {
    return Data(
      file: file ?? this.file,
      filesize: filesize ?? this.filesize,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [file, filesize];
}
