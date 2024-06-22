// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';
import 'package:test/test.dart';

void main() {
  group('Scene', () {
    group('example', () {
      test('should work', () {
        final scene = Scene.example;
        expect(scene, isNotNull);
      });
    });

    test('hashCode, operator==', () {
      final a = Scene(name: 'a', nodes: GgList<Node>.fromList([Node.example]));
      final a1 = Scene(name: 'a', nodes: GgList<Node>.fromList([Node.example]));
      final x = Scene(name: 'x', nodes: GgList<Node>.fromList([Node.example]));
      expect(a1, a);
      expect(a1.hashCode, a.hashCode);
      expect(a1, isNot(x));
      expect(a1.hashCode, isNot(x.hashCode));
    });
  });
}
