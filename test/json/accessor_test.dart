// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  final accessor = Accessor.example;

  group('Accessor', () {
    group('example', () {
      test('should work', () {
        expect(accessor, isNotNull);
      });
    });

    group('fromJson, toJson', () {
      test('should work', () {
        final a = accessor;
        final json = jsonEncode(a.toJson());
        final b = Accessor.fromJson(
          jsonDecode(json) as Map<String, dynamic>,
        );
        expect(a, b);
        expect(a.hashCode, b.hashCode);
      });
    });
  });
}
