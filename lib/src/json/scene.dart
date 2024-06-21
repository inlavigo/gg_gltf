// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scene.g.dart';

/// The root nodes of a scene.
@JsonSerializable()
class Scene {
  /// The root nodes of a scene.
  final List<int> nodes;

  /// Scene constructor
  const Scene({required this.nodes});

  /// Creates a new [Scene] from a json map.
  factory Scene.fromJson(Map<String, dynamic> json) => _$SceneFromJson(json);

  @override
  bool operator ==(Object other) {
    if (other is! Scene) return false;
    Scene scene = other;
    return const ListEquality<int>().equals(scene.nodes, other.nodes);
  }

  @override
  int get hashCode => Object.hashAll(nodes);

  /// Converts this [Scene] to a json map.
  Map<String, dynamic> toJson() => _$SceneToJson(this);

  // ...........................................................................
  /// Returns an example [Scene] instance for test purposes.
  static Scene get example => Gltf.example.scenes![0];
}
