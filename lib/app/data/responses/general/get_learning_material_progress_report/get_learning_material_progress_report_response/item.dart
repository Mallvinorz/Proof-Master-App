import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? finishedCount;
  final String? text;
  final int? totalCount;

  const Item({this.finishedCount, this.text, this.totalCount});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        finishedCount: data['finished_count'] as int?,
        text: data['text'] as String?,
        totalCount: data['total_count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'finished_count': finishedCount,
        'text': text,
        'total_count': totalCount,
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
    int? finishedCount,
    String? text,
    int? totalCount,
  }) {
    return Item(
      finishedCount: finishedCount ?? this.finishedCount,
      text: text ?? this.text,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [finishedCount, text, totalCount];
}
