// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// A primitive to be rendered.
class GltfPrimitive {
  /// Constructor
  GltfPrimitive({
    required this.name,
    required List<int> indices,
    required List<double> normals,
    required List<double> positions,
    required List<double> tangents,
    required List<double> colors,
    required List<double> textureCoordinates,
    this.mode = RenderModes.triangles,
  })  : indices = GgIntList.fromList(indices, listType: Uint16List),
        normals = GgFloatList.fromList(normals, listType: Float32List),
        positions = GgFloatList.fromList(positions, listType: Float32List),
        tangents = GgFloatList.fromList(tangents, listType: Float32List),
        colors = GgFloatList.fromList(colors, listType: Float32List),
        textureCoordinates = GgFloatList.fromList(
          textureCoordinates,
          listType: Float32List,
        );

  /// The name of the primitive
  final String name;

  /// The indices of the primitive.
  final GgIntList indices;

  /// The normals of the primitive.
  final GgFloatList normals;

  /// The positions of the primitive.
  final GgFloatList positions;

  /// The tangents of the primitive.
  final GgFloatList tangents;

  /// The texture coordinates of the primitive.
  final GgFloatList textureCoordinates;

  /// The texture coordinates of the primitive.
  final GgFloatList colors;

  /// The rendering mode of the primitive.
  final int mode;

  @override
  bool operator ==(Object other) {
    if (other is! GltfPrimitive) return false;
    GltfPrimitive primitive = other;
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
  static final example = ExamplePrimitives.triangle();
}
