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
          ExamplePrimitives.rectangle(
            normal: [
              0.0,
              0.0,
              1.0,
            ],
          ),
        ]),
      );

  /// Returns a cuboid mesh
  static Mesh cuboid() => Mesh(
        name: 'cuboid',
        primitives: GgList.fromList([
          // Front side
          ExamplePrimitives.rectangle(
            normal: [
              0.0,
              0.0,
              1.0,
            ],
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
            normal: [
              0.0,
              0.0,
              -1.0,
            ],
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
          // //// Top side
          ExamplePrimitives.rectangle(
            normal: [
              0.0,
              1.0,
              0.0,
            ],
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
            normal: [
              0.0,
              -1.0,
              0.0,
            ],
            indices: [
              /// Triangle 1
              0, 1, 2,

              /// Triangle 2
              0, 2, 3,
            ],
            positions: const [
              /// 0 Bottom right back
              1.0, 0.0, -1.0,

              /// 1 Bottom right front
              1.0, 0.0, 0.0,

              /// 2 Bottom left front
              0.0, 0.0, 0.0,

              /// 3 Bottom left back
              0.0, 0.0, -1.0,
            ],
          ),
          // Left side
          ExamplePrimitives.rectangle(
            normal: [
              -1.0,
              0.0,
              0.0,
            ],
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
            normal: [
              1.0,
              0.0,
              0.0,
            ],
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
