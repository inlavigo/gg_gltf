// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mesh_json.g.dart';

/// A set of primitives to be rendered.
@JsonSerializable(includeIfNull: false)
class MeshJson {
  /// The name of the mesh.
  final String? name;

  /// A set of primitives to be rendered.
  final List<PrimitiveJson> primitives;

  /// Mesh constructor
  const MeshJson({this.name, required this.primitives});

  /// Creates a new [MeshJson] from a json map.
  factory MeshJson.fromJson(Map<String, dynamic> json) =>
      _$MeshJsonFromJson(json);

  /// Converts this [MeshJson] to a json map.
  Map<String, dynamic> toJson() => _$MeshJsonToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! MeshJson) return false;
    MeshJson mesh = other;
    return mesh.name == name &&
        const ListEquality<PrimitiveJson>().equals(mesh.primitives, primitives);
  }

  @override
  int get hashCode => name.hashCode ^ Object.hashAll(primitives);

  // ...........................................................................
  /// Returns an example [MeshJson] instance for test purposes.
  static MeshJson get example => GltfJson.example.meshes[0];
}
