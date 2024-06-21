// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scene _$SceneFromJson(Map<String, dynamic> json) => Scene(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SceneToJson(Scene instance) => <String, dynamic>{
      'nodes': instance.nodes,
    };
