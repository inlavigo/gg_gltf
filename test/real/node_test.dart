// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  final gltfNode = Node.example;
  group('GltfNode', () {
    group('example', () {
      test('should work', () {
        expect(gltfNode.name, 'example');
      });
    });

    test('operator==, hashCode', () {
      const c = Node(name: 'c');
      final a = Node(name: 'a', children: [c], mesh: Mesh.example);
      final b = Node(name: 'a', children: [c], mesh: Mesh.example);
      final x = Node(name: 'x', children: [c], mesh: Mesh.example);

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
      expect(a, isNot(equals(x)));
      expect(a.hashCode, isNot(equals(x.hashCode)));
    });
  });
}
