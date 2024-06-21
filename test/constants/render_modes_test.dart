// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('RenderModes', () {
    group('example', () {
      test('should work', () {
        final renderModes = RenderModes();
        expect(renderModes, isNotNull);
        expect(RenderModes.points, 0);
        expect(RenderModes.lines, 1);
        expect(RenderModes.lineLoop, 2);
        expect(RenderModes.lineStrip, 3);
        expect(RenderModes.triangles, 4);
        expect(RenderModes.triangleStrip, 5);
        expect(RenderModes.triangleFan, 6);
      });
    });
  });
}
