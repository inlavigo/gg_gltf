// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mesh _$MeshFromJson(Map<String, dynamic> json) => Mesh(
      name: json['name'] as String?,
      primitives: (json['primitives'] as List<dynamic>)
          .map((e) => Primitive.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeshToJson(Mesh instance) => <String, dynamic>{
      'name': instance.name,
      'primitives': instance.primitives,
    };
