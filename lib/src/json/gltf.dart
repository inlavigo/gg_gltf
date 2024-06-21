// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gltf.g.dart';

/// The main entry point for the glTF 2.0 file format.
@JsonSerializable()
class Gltf {
  /// Metadata about the glTF asset.
  const Gltf({
    required this.asset,
    this.scenes,
    this.nodes,
    this.meshes,
    this.buffers,
    this.bufferViews,
    this.accessors,
  });

  /// Creates a new [Gltf] from a json map.
  factory Gltf.fromJson(Map<String, dynamic> json) => _$GltfFromJson(json);

  /// Converts this [Gltf] to a json map.
  Map<String, dynamic> toJson() => _$GltfToJson(this);

  /// Metadata about the glTF asset.
  final Asset asset;

  /// A list of scenes.
  final List<Scene>? scenes;

  /// A list of nodes.
  final List<Node>? nodes;

  /// A list of meshes.
  final List<Mesh>? meshes;

  /// A list of buffers.
  final List<Buffer>? buffers;

  /// A list of bufferViews.
  final List<BufferView>? bufferViews;

  /// A list of accessors.
  final List<Accessor>? accessors;

  @override
  bool operator ==(Object other) {
    if (other is! Gltf) return false;
    Gltf gltf = other;
    return gltf.asset == asset &&
        const ListEquality<Scene>().equals(gltf.scenes, scenes) &&
        const ListEquality<Node>().equals(gltf.nodes, nodes) &&
        const ListEquality<Mesh>().equals(gltf.meshes, meshes) &&
        const ListEquality<Buffer>().equals(gltf.buffers, buffers) &&
        const ListEquality<BufferView>()
            .equals(gltf.bufferViews, bufferViews) &&
        const ListEquality<Accessor>().equals(gltf.accessors, accessors);
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
  static Gltf get example => _example;
}

Gltf _example = Gltf.fromJson(
  jsonDecode(exampleJson) as Map<String, dynamic>,
);
