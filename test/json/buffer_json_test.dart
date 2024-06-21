// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('Buffer', () {
    final buffer = BufferJson.example;
    group('example', () {
      test('should work', () {
        expect(buffer, isNotNull);
      });
    });

    group('fromJson, toJson', () {
      test('should work', () {
        final a = buffer;
        final json = jsonEncode(a.toJson());
        final b = BufferJson.fromJson(
          jsonDecode(json) as Map<String, dynamic>,
        );
        expect(a, b);
        expect(a.hashCode, b.hashCode);
      });
    });
  });
}
