// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';

/// Example nodes for test purposes
class ExampleNodes {
  /// Returns a triangle node
  static Node triangle() => Node(
        name: 'triangle',
        mesh: ExampleMeshes.triangle(),
      );

  /// Returns a rectangle node
  static Node rectangle() => Node(
        name: 'rectangle',
        mesh: ExampleMeshes.rectangle(),
      );

  /// Returns a cuboid node
  static Node cuboid() => Node(
        name: 'cuboid',
        mesh: ExampleMeshes.cuboid(),
      );
}
