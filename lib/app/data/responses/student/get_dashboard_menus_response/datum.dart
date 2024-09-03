import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? category;
  final String? id;
  final String? title;
  final String? icUrl;
  final String? desc;
  final int? finishedMaterials;
  final int? totalMaterials;
  final bool? isLocked;
  final String? endpoint;

  const Datum({
    this.category,
    this.id,
    this.title,
    this.icUrl,
    this.desc,
    this.finishedMaterials,
    this.totalMaterials,
    this.isLocked,
    this.endpoint,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        category: data['category'] as String?,
        id: data['id'] as String?,
        title: data['title'] as String?,
        icUrl: data['ic_url'] as String?,
        desc: data['desc'] as String?,
        finishedMaterials: data['finished_materials'] as int?,
        totalMaterials: data['total_materials'] as int?,
        isLocked: data['is_locked'] as bool?,
        endpoint: data['endpoint'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'category': category,
        'id': id,
        'title': title,
        'ic_url': icUrl,
        'desc': desc,
        'finished_materials': finishedMaterials,
        'total_materials': totalMaterials,
        'is_locked': isLocked,
        'endpoint': endpoint,
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
    String? category,
    String? id,
    String? title,
    String? icUrl,
    String? desc,
    int? finishedMaterials,
    int? totalMaterials,
    bool? isLocked,
    String? endpoint,
  }) {
    return Datum(
      category: category ?? this.category,
      id: id ?? this.id,
      title: title ?? this.title,
      icUrl: icUrl ?? this.icUrl,
      desc: desc ?? this.desc,
      finishedMaterials: finishedMaterials ?? this.finishedMaterials,
      totalMaterials: totalMaterials ?? this.totalMaterials,
      isLocked: isLocked ?? this.isLocked,
      endpoint: endpoint ?? this.endpoint,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      category,
      id,
      title,
      icUrl,
      desc,
      finishedMaterials,
      totalMaterials,
      isLocked,
      endpoint,
    ];
  }
}
