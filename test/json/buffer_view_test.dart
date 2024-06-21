// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('BufferView', () {
    group('example', () {
      test('should work', () {
        final bufferView = BufferView.example;
        expect(bufferView, isNotNull);
      });
    });

    test('fromJson, toJson', () {
      final a = BufferView.example;
      final json = a.toJson();
      final b = BufferView.fromJson(json);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });
  });
}
