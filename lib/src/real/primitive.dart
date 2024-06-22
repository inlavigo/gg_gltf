// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';

/// A primitive to be rendered.
class Primitive {
  /// Constructor
  const Primitive({
    required this.name,
    required this.indices,
    required this.normals,
    required this.positions,
    required this.tangents,
    required this.colors,
    required this.textureCoordinates,
    this.mode = RenderModes.triangles,
  });

  /// The name of the primitive
  final String name;

  /// The indices of the primitive.
  final Uint16List indices;

  /// The normals of the primitive.
  final Float32List normals;

  /// The positions of the primitive.
  final Float32List positions;

  /// The tangents of the primitive.
  final Float32List tangents;

  /// The texture coordinates of the primitive.
  final Float32List textureCoordinates;

  /// The texture coordinates of the primitive.
  final Float32List colors;

  /// The rendering mode of the primitive.
  final int mode;

  @override
  bool operator ==(Object other) {
    if (other is! Primitive) return false;
    Primitive primitive = other;
    return primitive.name == name &&
        primitive.mode == mode &&
        const ListEquality<int>().equals(primitive.indices, indices) &&
        const ListEquality<double>().equals(primitive.normals, normals) &&
        const ListEquality<double>().equals(primitive.positions, positions) &&
        const ListEquality<double>().equals(primitive.tangents, tangents) &&
        const ListEquality<double>().equals(primitive.colors, colors) &&
        const ListEquality<double>()
            .equals(primitive.textureCoordinates, textureCoordinates);
  }

  @override
  int get hashCode =>
      name.hashCode ^
      mode.hashCode ^
      Object.hashAll(indices) ^
      Object.hashAll(normals) ^
      Object.hashAll(positions) ^
      Object.hashAll(tangents) ^
      Object.hashAll(colors) ^
      Object.hashAll(textureCoordinates);

  // ...........................................................................
  /// Example primitive
  static final example = Primitive(
    name: 'example',
    indices: Uint16List.fromList([0, 1, 2, 3, 4, 5]),
    normals: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
    positions: Float32List.fromList([0.0, 0.0, 0.0, 1.0, 0.0, 0.0]),
    tangents: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0]),
    colors: Float32List.fromList([0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 1.0]),
    textureCoordinates: Float32List.fromList([0.0, 0.0, 1.0, 0.0]),
  );
}
