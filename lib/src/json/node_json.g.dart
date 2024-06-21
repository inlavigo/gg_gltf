// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeJson _$NodeJsonFromJson(Map<String, dynamic> json) => NodeJson(
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mesh: (json['mesh'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NodeJsonToJson(NodeJson instance) => <String, dynamic>{
      'name': instance.name,
      'children': instance.children,
      'mesh': instance.mesh,
    };
