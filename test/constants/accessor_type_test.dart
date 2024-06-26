// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('AccessorType', () {
    group('example', () {
      test('should work', () {
        final accessorType = AccessorType();
        expect(accessorType, isNotNull);

        expect(AccessorType.scalar, 'SCALAR');

        expect(AccessorType.vec2, 'VEC2');

        expect(AccessorType.vec3, 'VEC3');

        expect(AccessorType.vec4, 'VEC4');
      });
    });

    group('stride', () {
      test('should work', () {
        final accessorType = AccessorType();
        expect(accessorType, isNotNull);

        expect(accessorType.stride('indices'), 1);

        expect(accessorType.stride('normals'), 3);

        expect(accessorType.stride('positions'), 3);

        expect(accessorType.stride('tangents'), 4);

        expect(accessorType.stride('textureCoordinates'), 2);

        expect(accessorType.stride('colors'), 4);

        expect(() => accessorType.stride('unknown'), throwsArgumentError);
      });
    });
  });
}
