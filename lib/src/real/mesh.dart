// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// The mesh is a collection of primitives to be rendered.
class Mesh {
  /// Constructor
  Mesh({
    required this.name,
    required List<Primitive> primitives,
  }) : primitives = GgList.fromList(primitives) {
    _hashCode = name.hashCode ^ primitives.hashCode;
  }

  /// The name of the mesh.
  final String name;

  /// The primitives that make up the mesh.
  final GgList<Primitive> primitives;

  @override
  bool operator ==(Object other) => other.hashCode == hashCode;

  @override
  int get hashCode => _hashCode;

  /// Example mesh
  static final example = Mesh(
    name: 'example',
    primitives: GgList.fromList([
      Primitive.example,
    ]),
  );

  late final int _hashCode;
}
