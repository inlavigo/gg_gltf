// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';

/// The mesh is a collection of primitives to be rendered.
class Mesh {
  /// Constructor
  const Mesh({
    required this.name,
    required this.primitives,
  });

  /// The name of the mesh.
  final String name;

  /// The primitives that make up the mesh.
  final List<Primitive> primitives;

  @override
  bool operator ==(Object other) {
    if (other is! Mesh) return false;
    Mesh mesh = other;
    return mesh.name == name &&
        const ListEquality<Primitive>().equals(mesh.primitives, primitives);
  }

  @override
  int get hashCode => name.hashCode ^ Object.hashAll(primitives);

  /// Example mesh
  static final example = Mesh(
    name: 'example',
    primitives: [
      Primitive.example,
    ],
  );
}
