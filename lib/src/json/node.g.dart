// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Node _$NodeFromJson(Map<String, dynamic> json) => Node(
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mesh: (json['mesh'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      'name': instance.name,
      'children': instance.children,
      'mesh': instance.mesh,
    };
