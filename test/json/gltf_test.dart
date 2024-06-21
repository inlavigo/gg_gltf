// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('Gltf', () {
    group('example', () {
      test('should work', () {
        final gltf = Gltf.example;
        expect(gltf, isNotNull);
      });
    });

    test('toJson, fromJson', () {
      final a = Gltf.example;
      final json = jsonEncode(a.toJson());
      final b = Gltf.fromJson(jsonDecode(json) as Map<String, dynamic>);
      expect(a.asset, isNotNull);
      expect(a.scenes, isNotNull);
      expect(a.nodes, isNotNull);
      expect(a.meshes, isNotNull);
      expect(a.buffers, isNotNull);
      expect(a.bufferViews, isNotNull);
      expect(a.accessors, isNotNull);
      expect(a.hashCode, b.hashCode);

      expect(a, b);
    });
  });
}
