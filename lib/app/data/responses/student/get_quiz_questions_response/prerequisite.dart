import 'dart:convert';

import 'package:equatable/equatable.dart';

class Prerequisite extends Equatable {
  final String? imageUrl;
  final String? desc;

  const Prerequisite({this.imageUrl, this.desc});

  factory Prerequisite.fromMap(Map<String, dynamic> data) => Prerequisite(
        imageUrl: data['image'] as String?,
        desc: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'image': imageUrl,
        'description': desc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Prerequisite].
  factory Prerequisite.fromJson(String data) {
    return Prerequisite.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Prerequisite] to a JSON string.
  String toJson() => json.encode(toMap());

  Prerequisite copyWith({
    String? imageUrl,
    String? desc,
  }) {
    return Prerequisite(
      imageUrl: imageUrl ?? this.imageUrl,
      desc: desc ?? this.desc,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [imageUrl, desc];
}
