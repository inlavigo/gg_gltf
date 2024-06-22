// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scene_json.g.dart';

/// The root nodes of a scene.
@JsonSerializable(includeIfNull: false)
class SceneJson {
  /// The root nodes of a scene.
  final List<int> nodes;

  /// Scene constructor
  const SceneJson({required this.nodes});

  /// Creates a new [SceneJson] from a json map.
  factory SceneJson.fromJson(Map<String, dynamic> json) =>
      _$SceneJsonFromJson(json);

  @override
  bool operator ==(Object other) {
    if (other is! SceneJson) return false;
    SceneJson scene = other;
    return const ListEquality<int>().equals(scene.nodes, other.nodes);
  }

  @override
  int get hashCode => Object.hashAll(nodes);

  /// Converts this [SceneJson] to a json map.
  Map<String, dynamic> toJson() => _$SceneJsonToJson(this);

  // ...........................................................................
  /// Returns an example [SceneJson] instance for test purposes.
  static SceneJson get example => GltfJson.example.scenes[0];
}
