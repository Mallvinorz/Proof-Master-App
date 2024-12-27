import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? role;
  final String? name;
  final String? email;
  final String? photoUrl;

  const Data({this.role, this.name, this.email, this.photoUrl});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        role: data['role'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        photoUrl: data['photo_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'role': role,
        'name': name,
        'email': email,
        'photo_url': photoUrl,
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
    String? role,
    String? name,
    String? email,
    String? photoUrl,
  }) {
    return Data(
      role: role ?? this.role,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [role, name, email, photoUrl];
}
