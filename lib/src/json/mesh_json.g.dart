// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeshJson _$MeshJsonFromJson(Map<String, dynamic> json) => MeshJson(
      name: json['name'] as String?,
      primitives: (json['primitives'] as List<dynamic>)
          .map((e) => PrimitiveJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeshJsonToJson(MeshJson instance) => <String, dynamic>{
      'name': instance.name,
      'primitives': instance.primitives,
    };
