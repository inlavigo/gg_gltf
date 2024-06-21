// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gltf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gltf _$GltfFromJson(Map<String, dynamic> json) => Gltf(
      asset: Asset.fromJson(json['asset'] as Map<String, dynamic>),
      scenes: (json['scenes'] as List<dynamic>?)
          ?.map((e) => Scene.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodes: (json['nodes'] as List<dynamic>?)
          ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      meshes: (json['meshes'] as List<dynamic>?)
          ?.map((e) => Mesh.fromJson(e as Map<String, dynamic>))
          .toList(),
      buffers: (json['buffers'] as List<dynamic>?)
          ?.map((e) => Buffer.fromJson(e as Map<String, dynamic>))
          .toList(),
      bufferViews: (json['bufferViews'] as List<dynamic>?)
          ?.map((e) => BufferView.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessors: (json['accessors'] as List<dynamic>?)
          ?.map((e) => Accessor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GltfToJson(Gltf instance) => <String, dynamic>{
      'asset': instance.asset,
      'scenes': instance.scenes,
      'nodes': instance.nodes,
      'meshes': instance.meshes,
      'buffers': instance.buffers,
      'bufferViews': instance.bufferViews,
      'accessors': instance.accessors,
    };
