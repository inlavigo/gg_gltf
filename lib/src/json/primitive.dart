// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'primitive.g.dart';

/// Geometry to be rendered with the given material.
@JsonSerializable()
class Primitive {
  /// A dictionary object, where each key corresponds to mesh attribute semantic
  final Map<String, int> attributes;

  /// The index of the accessor that contains the indices.
  final int? indices;

  /// The index of the material to apply to this primitive when rendering.
  final int? material;

  /// The type of primitives to render.
  final int mode;

  /// Primitive constructor
  const Primitive({
    required this.attributes,
    this.indices,
    this.material,
    this.mode = 4,
  });

  @override
  bool operator ==(Object other) {
    if (other is! Primitive) return false;
    Primitive primitive = other;
    return const MapEquality<String, int>()
            .equals(primitive.attributes, attributes) &&
        primitive.indices == indices &&
        primitive.material == material &&
        primitive.mode == mode;
  }

  @override
  int get hashCode =>
      Object.hashAll(attributes.keys) ^
      Object.hashAll(attributes.values) ^
      indices.hashCode ^
      material.hashCode ^
      mode.hashCode;

  /// Creates a new [Primitive] from a json map.
  factory Primitive.fromJson(Map<String, dynamic> json) =>
      _$PrimitiveFromJson(json);

  /// Converts this [Primitive] to a json map.
  Map<String, dynamic> toJson() => _$PrimitiveToJson(this);

  // ...........................................................................
  /// Returns an example [Primitive] instance for test purposes.
  static Primitive get example => Gltf.example.meshes![0].primitives[0];
}
