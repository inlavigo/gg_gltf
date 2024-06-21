// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'node.g.dart';

/// A node in the node hierarchy.
@JsonSerializable()
class Node {
  /// The name of the node.
  final String? name;

  /// The children of this node.
  final List<int>? children;

  /// The mesh in this node.
  final int? mesh;

  /// Node constructor
  const Node({this.name, this.children, this.mesh});

  /// Creates a new [Node] from a json map.
  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  /// Converts this [Node] to a json map.
  Map<String, dynamic> toJson() => _$NodeToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! Node) return false;
    Node node = other;
    return node.name == name && node.children == children && node.mesh == mesh;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      (children != null ? Object.hashAll(children!) : 0) ^
      mesh.hashCode;

  // ...........................................................................
  /// Returns an example [Node] instance for test purposes.
  static Node get example => Gltf.example.nodes![0];
}
