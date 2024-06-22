// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:typed_data';

import 'package:gg_gltf/gg_gltf.dart';
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
      indices: Uint16List.fromList([0, 1, 2, 3, 4, 5]),
      normals: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      positions: Float32List.fromList([0.0, 0.0, 0.0, 1.0, 0.0, 0.0]),
      tangents: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      textureCoordinates: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
      colors: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
    );

    final b = Primitive(
      name: 'a',
      indices: Uint16List.fromList([0, 1, 2, 3, 4, 5]),
      normals: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      positions: Float32List.fromList([0.0, 0.0, 0.0, 1.0, 0.0, 0.0]),
      tangents: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      textureCoordinates: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
      colors: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
    );

    const change = 0.0001;
    final x = Primitive(
      name: 'a',
      indices: Uint16List.fromList([0, 1, 2, 3, 4, 5]),
      normals: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      positions: Float32List.fromList([0.0, 0.0, 0.0, 1.0, 0.0, 0.0 + change]),
      tangents: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
      textureCoordinates: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
      colors: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
    );

    expect(a, b);
    expect(a.hashCode, b.hashCode);
    expect(a, isNot(x));
    expect(a.hashCode, isNot(x.hashCode));
  });
}
