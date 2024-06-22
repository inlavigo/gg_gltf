// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// Example meshes for test purposes
class ExampleMeshes {
  /// Returns a triangle mesh
  static Mesh triangle() => Mesh(
        name: 'triangle',
        primitives: GgList.fromList([
          ExamplePrimitives.triangle(),
        ]),
      );

  /// Returns a rectangle mesh
  static Mesh rectangle() => Mesh(
        name: 'rectangle',
        primitives: GgList.fromList([
          ExamplePrimitives.rectangle(),
        ]),
      );

  /// Returns a cuboid mesh
  static Mesh cuboid() => Mesh(
        name: 'cuboid',
        primitives: GgList.fromList([
          // Front side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Bottom left front
              0.0, 0.0, 0.0,

              /// Bottom right front
              1.0, 0.0, 0.0,

              /// Top left front
              0.0, 1.0, 0.0,

              /// Top right front
              1.0, 1.0, 0.0,
            ],
          ),
          // Back side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Bottom right back
              1.0, 0.0, -1.0,

              /// Bottom left back
              0.0, 0.0, -1.0,

              /// Top right back
              1.0, 1.0, -1.0,

              /// Top left back
              0.0, 1.0, -1.0,
            ],
          ),
          // Top side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Top left front
              0.0, 1.0, 0.0,

              /// Top right front
              1.0, 1.0, 0.0,

              /// Top left back
              0.0, 1.0, -1.0,

              /// Top right back
              1.0, 1.0, -1.0,
            ],
          ),
          // Bottom side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Bottom left front
              0.0, 0.0, 0.0,

              /// Bottom right front
              1.0, 0.0, 0.0,

              /// Bottom left back
              0.0, 0.0, -1.0,

              /// Bottom right back
              1.0, 0.0, -1.0,
            ],
          ),
          // Left side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Bottom left back
              0.0, 0.0, -1.0,

              /// Bottom left front
              0.0, 0.0, 0.0,

              /// Top left back
              0.0, 1.0, -1.0,

              /// Top left front
              0.0, 1.0, 0.0,
            ],
          ),
          // Right side
          ExamplePrimitives.rectangle(
            positions: const [
              /// Bottom right front
              1.0, 0.0, 0.0,

              /// Bottom right back
              1.0, 0.0, -1.0,

              /// Top right front
              1.0, 1.0, 0.0,

              /// Top right back
              1.0, 1.0, -1.0,
            ],
          ),
        ]),
      );
}
