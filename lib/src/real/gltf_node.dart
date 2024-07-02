// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_gltf/src/real/gltf_mesh.dart';

/// A node in a gltf file
class GltfNode {
  /// Constructor
  const GltfNode({
    required this.name,
    this.children = const [],
    this.mesh,
    this.translation,
  });

  /// The name of the node
  final String name;

  /// The children of the node
  final List<GltfNode> children;

  /// The mesh of the node
  final GltfMesh? mesh;

  /// The translation of the node
  final List<double>? translation;

  @override
  bool operator ==(Object other) {
    if (other is! GltfNode) return false;
    GltfNode node = other;
    return node.name == name &&
        const ListEquality<GltfNode>().equals(node.children, children) &&
        node.mesh == mesh;
  }

  @override
  int get hashCode => name.hashCode ^ Object.hashAll(children) ^ mesh.hashCode;

  /// Example node for test purposes
  static final example = GltfNode(
    name: 'example',
    mesh: GltfMesh.example,
  );
}
