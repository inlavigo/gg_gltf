// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mesh.g.dart';

/// A set of primitives to be rendered.
@JsonSerializable()
class Mesh {
  /// The name of the mesh.
  final String? name;

  /// A set of primitives to be rendered.
  final List<Primitive> primitives;

  /// Mesh constructor
  const Mesh({this.name, required this.primitives});

  /// Creates a new [Mesh] from a json map.
  factory Mesh.fromJson(Map<String, dynamic> json) => _$MeshFromJson(json);

  /// Converts this [Mesh] to a json map.
  Map<String, dynamic> toJson() => _$MeshToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! Mesh) return false;
    Mesh mesh = other;
    return mesh.name == name &&
        const ListEquality<Primitive>().equals(mesh.primitives, primitives);
  }

  @override
  int get hashCode => name.hashCode ^ Object.hashAll(primitives);

  // ...........................................................................
  /// Returns an example [Mesh] instance for test purposes.
  static Mesh get example => Gltf.example.meshes![0];
}
