// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'primitive_json.g.dart';

/// Geometry to be rendered with the given material.
@JsonSerializable()
class PrimitiveJson {
  /// A dictionary object, where each key corresponds to mesh attribute semantic
  final Map<String, int> attributes;

  /// The index of the accessor that contains the indices.
  final int? indices;

  /// The index of the material to apply to this primitive when rendering.
  final int? material;

  /// The type of primitives to render.
  final int mode;

  /// Primitive constructor
  const PrimitiveJson({
    required this.attributes,
    this.indices,
    this.material,
    this.mode = 4,
  });

  @override
  bool operator ==(Object other) {
    if (other is! PrimitiveJson) return false;
    PrimitiveJson primitive = other;
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

  /// Creates a new [PrimitiveJson] from a json map.
  factory PrimitiveJson.fromJson(Map<String, dynamic> json) =>
      _$PrimitiveJsonFromJson(json);

  /// Converts this [PrimitiveJson] to a json map.
  Map<String, dynamic> toJson() => _$PrimitiveJsonToJson(this);

  // ...........................................................................
  /// Returns an example [PrimitiveJson] instance for test purposes.
  static PrimitiveJson get example => GltfJson.example.meshes[0].primitives[0];
}
