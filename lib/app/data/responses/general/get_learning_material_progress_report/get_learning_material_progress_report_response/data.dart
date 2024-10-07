import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';

class Data extends Equatable {
  final List<Item>? items;

  const Data({this.items});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
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
    List<Item>? items,
  }) {
    return Data(
      items: items ?? this.items,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [items];
}
