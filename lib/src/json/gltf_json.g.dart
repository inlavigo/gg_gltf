// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gltf_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GltfJson _$GltfJsonFromJson(Map<String, dynamic> json) => GltfJson(
      asset: AssetJson.fromJson(json['asset'] as Map<String, dynamic>),
      scenes: (json['scenes'] as List<dynamic>?)
          ?.map((e) => SceneJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodes: (json['nodes'] as List<dynamic>?)
          ?.map((e) => NodeJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      meshes: (json['meshes'] as List<dynamic>?)
          ?.map((e) => MeshJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      buffers: (json['buffers'] as List<dynamic>?)
          ?.map((e) => BufferJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      bufferViews: (json['bufferViews'] as List<dynamic>?)
          ?.map((e) => BufferViewJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessors: (json['accessors'] as List<dynamic>?)
          ?.map((e) => AccessorJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GltfJsonToJson(GltfJson instance) => <String, dynamic>{
      'asset': instance.asset,
      'scenes': instance.scenes,
      'nodes': instance.nodes,
      'meshes': instance.meshes,
      'buffers': instance.buffers,
      'bufferViews': instance.bufferViews,
      'accessors': instance.accessors,
    };
