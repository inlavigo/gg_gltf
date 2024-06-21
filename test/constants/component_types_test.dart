// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('ComponentTypes', () {
    group('example', () {
      test('should work', () {
        final componentTypes = ComponentTypes();
        expect(componentTypes, isNotNull);
        expect(ComponentTypes.byte, 5120);
        expect(ComponentTypes.unsignedByte, 5121);
        expect(ComponentTypes.short, 5122);
        expect(ComponentTypes.unsignedShort, 5123);
        expect(ComponentTypes.unsignedInt, 5125);
        expect(ComponentTypes.float, 5126);
      });
    });
  });
}
