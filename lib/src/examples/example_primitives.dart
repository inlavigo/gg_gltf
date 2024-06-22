// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:typed_data';

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// Example primitives for test purposes
class ExamplePrimitives {
  /// A simple triangle
  static Primitive triangle() => Primitive(
        name: 'rectangle',
        indices: GgIntList.fromList(
          [
            /// Point 1
            0,

            /// Point 2
            1,

            /// Point3
            2,
          ],
          min: 0,
          max: GgRanges.uint16Max,
        ),
        positions: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0, 0.0,

            /// Point 2
            1.0, 0.0, 0.0,

            /// Point 3
            0.0, 1.0, 0.0,
          ],
          listType: Float32List,
        ),
        normals: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0, 1.0,

            /// Point 2
            0.0, 0.0, 1.0,

            /// Point 3
            0.0, 0.0, 1.0,
          ],
          listType: Float32List,
        ),
        tangents: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0, 1.0, 1.0,

            /// Point 2
            0.0, 0.0, 1.0, 1.0,

            /// Point 3
            0.0, 0.0, 1.0, 1.0,
          ],
          listType: Float32List,
        ),
        colors: GgFloatList.fromList(
          [
            /// Point 1 (blue)
            0.0, 0.0, 1.0, 1.0,

            /// Point 2 (green)
            0.0, 1.0, 0.0, 1.0,

            /// Point 3 (red)
            1.0, 0.0, 0.0, 1.0,
          ],
          listType: Float32List,
        ),
        textureCoordinates: GgFloatList.fromList(
          [
            /// Point 1
            0.0,
            0.0,

            /// Point 2
            1.0,
            1.0,

            /// Point 3
            0.0,
            1.0,
          ],
          listType: Float32List,
        ),
      );

  /// A simple rectangle
  static Primitive rectangle({
    List<double> positions = const [
      /// Point 1
      0.0, 0.0, 0.0,

      /// Point 2
      1.0, 0.0, 0.0,

      /// Point 3
      0.0, 1.0, 0.0,

      /// Point 4
      1.0, 1.0, 0.0,
    ],
  }) =>
      Primitive(
        name: 'rectangle',
        indices: GgIntList.fromList(
          [
            /// Triangle 1
            0, 1, 2,

            /// Triangle 2
            2, 1, 3,
          ],
          min: 0,
          max: GgRanges.uint16Max,
        ),
        positions: GgFloatList.fromList(
          positions,
          listType: Float32List,
        ),
        normals: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0, 1.0,

            /// Point 2
            0.0, 0.0, 1.0,

            /// Point 3
            0.0, 0.0, 1.0,

            /// Point 4
            0.0, 0.0, 1.0,
          ],
          listType: Float32List,
        ),
        tangents: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0, 1.0, 1.0,

            /// Point 2
            0.0, 0.0, 1.0, 1.0,

            /// Point 3
            0.0, 0.0, 1.0, 1.0,

            /// Point 4
            0.0, 0.0, 1.0, 1.0,
          ],
          listType: Float32List,
        ),
        colors: GgFloatList.fromList(
          [
            /// Point 1 (blue)
            0.0, 0.0, 1.0, 1.0,

            /// Point 2 (green)
            0.0, 1.0, 0.0, 1.0,

            /// Point 3 (red)
            1.0, 0.0, 0.0, 1.0,

            /// Point 4 (yellow)
            1.0, 1.0, 0.0, 1.0,
          ],
          listType: Float32List,
        ),
        textureCoordinates: GgFloatList.fromList(
          [
            /// Point 1
            0.0, 0.0,

            /// Point 2
            1.0, 0.0,

            /// Point 3
            0.0, 1.0,

            /// Point 4
            1.0, 1.0,
          ],
          listType: Float32List,
        ),
      );
}
