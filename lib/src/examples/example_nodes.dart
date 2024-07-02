// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';

/// Example nodes for test purposes
class ExampleNodes {
  /// Returns a triangle node
  static GltfNode triangle() => GltfNode(
        name: 'triangle',
        mesh: ExampleMeshes.triangle(),
      );

  /// Returns a rectangle node
  static GltfNode rectangle() => GltfNode(
        name: 'rectangle',
        mesh: ExampleMeshes.rectangle(),
      );

  /// Returns a cuboid node
  static GltfNode cuboid() => GltfNode(
        name: 'cuboid',
        mesh: ExampleMeshes.cuboid(),
      );

  /// Returns a node with a child node showing a triangle
  static GltfNode parentWithChild() => GltfNode(
        name: 'parentWithChild',
        children: [
          triangle(),
        ],
      );
}
