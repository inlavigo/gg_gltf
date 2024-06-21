// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gltf_json.g.dart';

/// The main entry point for the glTF 2.0 file format.
@JsonSerializable()
class GltfJson {
  /// Metadata about the glTF asset.
  const GltfJson({
    required this.asset,
    this.scenes,
    this.nodes,
    this.meshes,
    this.buffers,
    this.bufferViews,
    this.accessors,
  });

  /// Creates a new [GltfJson] from a json map.
  factory GltfJson.fromJson(Map<String, dynamic> json) =>
      _$GltfJsonFromJson(json);

  /// Converts this [GltfJson] to a json map.
  Map<String, dynamic> toJson() => _$GltfJsonToJson(this);

  /// Metadata about the glTF asset.
  final AssetJson asset;

  /// A list of scenes.
  final List<SceneJson>? scenes;

  /// A list of nodes.
  final List<NodeJson>? nodes;

  /// A list of meshes.
  final List<MeshJson>? meshes;

  /// A list of buffers.
  final List<BufferJson>? buffers;

  /// A list of bufferViews.
  final List<BufferViewJson>? bufferViews;

  /// A list of accessors.
  final List<AccessorJson>? accessors;

  @override
  bool operator ==(Object other) {
    if (other is! GltfJson) return false;
    GltfJson gltf = other;
    return gltf.asset == asset &&
        const ListEquality<SceneJson>().equals(gltf.scenes, scenes) &&
        const ListEquality<NodeJson>().equals(gltf.nodes, nodes) &&
        const ListEquality<MeshJson>().equals(gltf.meshes, meshes) &&
        const ListEquality<BufferJson>().equals(gltf.buffers, buffers) &&
        const ListEquality<BufferViewJson>()
            .equals(gltf.bufferViews, bufferViews) &&
        const ListEquality<AccessorJson>().equals(gltf.accessors, accessors);
  }

  @override
  int get hashCode =>
      asset.hashCode ^
      (scenes != null ? Object.hashAll(scenes!) : 0) ^
      (nodes != null ? Object.hashAll(nodes!) : 0) ^
      (meshes != null ? Object.hashAll(meshes!) : 0) ^
      (buffers != null ? Object.hashAll(buffers!) : 0) ^
      (bufferViews != null ? Object.hashAll(bufferViews!) : 0) ^
      (accessors != null ? Object.hashAll(accessors!) : 0);

  // ...........................................................................
  /// Returns an example glTF instance
  static GltfJson get example => _example;
}

GltfJson _example = GltfJson.fromJson(
  jsonDecode(exampleJson) as Map<String, dynamic>,
);
