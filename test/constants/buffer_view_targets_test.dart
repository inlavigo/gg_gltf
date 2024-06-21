// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('BufferViewTargets', () {
    group('example', () {
      test('should work', () {
        final bufferViewTargets = BufferViewTargets();
        expect(bufferViewTargets, isNotNull);
        expect(BufferViewTargets.arrayBuffer, 34962);
        expect(BufferViewTargets.elementArrayBuffer, 34963);
      });
    });
  });
}
