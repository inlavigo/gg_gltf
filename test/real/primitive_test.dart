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
  group('Primitive', () {
    group('example', () {
      test('should work', () {
        final primitive = Primitive.example;
        expect(primitive, isNotNull);
        expect(primitive.indices, [0, 1, 2, 3, 4, 5]);
        expect(primitive.normals, [0.0, 0.0, 1.0, 0.0, 0.0, 1.0]);
        expect(primitive.positions, [0.0, 0.0, 0.0, 1.0, 0.0, 0.0]);
        expect(primitive.tangents, [0.0, 0.0, 1.0, 0.0, 0.0, 1.0]);
        expect(primitive.textureCoordinates, [0.0, 0.0, 1.0, 0.0]);
      });
    });
  });

  test('operator==, hashCode', () {
    final a = Primitive(
      name: 'a',
      indices: GgIntList.fromList(
        [0, 1, 2, 3, 4, 5],
        listType: Uint16List,
      ),
      normals: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
        listType: Float32List,
      ),
      positions: GgFloatList.fromList(
        [0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
        listType: Float32List,
      ),
      tangents: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
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
    );

    final b = Primitive(
      name: 'a',
      indices: GgIntList.fromList(
        [0, 1, 2, 3, 4, 5],
        listType: Uint16List,
      ),
      normals: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
        listType: Float32List,
      ),
      positions: GgFloatList.fromList(
        [0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
        listType: Float32List,
      ),
      tangents: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
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
    );

    const change = 0.0001;
    final x = Primitive(
      name: 'a',
      indices: GgIntList.fromList(
        [0, 1, 2, 3, 4, 5],
        listType: Uint16List,
      ),
      normals: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
        listType: Float32List,
      ),
      positions: GgFloatList.fromList(
        [0.0, 0.0, 0.0, 1.0, 0.0, 0.0 + change],
        listType: Float32List,
      ),
      tangents: GgFloatList.fromList(
        [0.0, 0.0, 1.0, 0.0, 0.0, 1.0],
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
    );

    expect(a, b);
    expect(a.hashCode, b.hashCode);
    expect(a, isNot(x));
    expect(a.hashCode, isNot(x.hashCode));
  });
}
