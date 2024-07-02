// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:typed_data';

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';
import 'package:test/test.dart';

void main() {
  GltfMesh createMesh({bool withChange = false}) {
    final change = withChange ? 0.0001 : 0;
    final x = GltfMesh(
      name: 'a',
      primitives: GgList.fromList(
        [
          GltfPrimitive(
            name: 'a',
            indices:
                GgIntList.fromList([0, 1, 2, 3, 4, 5], listType: Uint16List),
            normals: GgFloatList.fromList(
              [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
              listType: Float32List,
            ),
            positions: GgFloatList.fromList(
              [0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
              listType: Float32List,
            ),
            tangents: GgFloatList.fromList(
              [0.0, 0.0, 1.0, 0.0, 0.0, 1.0 + change],
              listType: Float32List,
            ),
            textureCoordinates: GgFloatList.fromList(
              [0.0, 0.0, 1.0, 0.0],
              listType: Float32List,
            ),
            colors: GgFloatList.fromList(
              [0.0, 0.0, 1.0, 0.0],
              listType: Float32List,
            ),
          ),
        ],
      ),
    );

    return x;
  }

  group('Mesh', () {
    group('example', () {
      test('should work', () {
        final mesh = GltfMesh.example;
        expect(mesh, isNotNull);
      });
    });
  });

  test('operator==, hashcode', () {
    final a = createMesh();
    final b = createMesh();
    final x = createMesh(withChange: true);

    expect(a, b);
    expect(a.hashCode, b.hashCode);

    expect(a, isNot(x));
    expect(a.hashCode, isNot(x.hashCode));
  });
}
