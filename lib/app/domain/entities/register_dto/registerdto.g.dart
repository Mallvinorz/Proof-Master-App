// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterDTOImpl _$$RegisterDTOImplFromJson(Map<String, dynamic> json) =>
    _$RegisterDTOImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      nim: json['nim'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$RegisterDTOImplToJson(_$RegisterDTOImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'nim': instance.nim,
      'name': instance.name,
    };
