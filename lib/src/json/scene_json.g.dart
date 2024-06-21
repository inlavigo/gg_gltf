// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SceneJson _$SceneJsonFromJson(Map<String, dynamic> json) => SceneJson(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SceneJsonToJson(SceneJson instance) => <String, dynamic>{
      'nodes': instance.nodes,
    };
