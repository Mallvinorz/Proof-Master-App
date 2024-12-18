import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? id;
  final String? menuText;
  final String? menuDesc;

  const Item({this.id, this.menuText, this.menuDesc});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        id: data['id'] as String?,
        menuText: data['menuText'] as String?,
        menuDesc: data['menuDesc'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'menuText': menuText,
        'menuDesc': menuDesc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    String? id,
    String? menuText,
    String? menuDesc,
  }) {
    return Item(
      id: id ?? this.id,
      menuText: menuText ?? this.menuText,
      menuDesc: menuDesc ?? this.menuDesc,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, menuText, menuDesc];
}
