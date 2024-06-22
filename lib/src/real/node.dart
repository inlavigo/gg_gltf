// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_gltf/src/real/mesh.dart';

/// A node in a gltf file
class Node {
  /// Constructor
  const Node({
    required this.name,
    this.children = const [],
    this.mesh,
  });

  /// The name of the node
  final String name;

  /// The children of the node
  final List<Node> children;

  /// The mesh of the node
  final Mesh? mesh;

  @override
  bool operator ==(Object other) {
    if (other is! Node) return false;
    Node node = other;
    return node.name == name &&
        const ListEquality<Node>().equals(node.children, children) &&
        node.mesh == mesh;
  }

  @override
  int get hashCode => name.hashCode ^ Object.hashAll(children) ^ mesh.hashCode;

  /// Example node for test purposes
  static final example = Node(
    name: 'example',
    mesh: Mesh.example,
  );
}
