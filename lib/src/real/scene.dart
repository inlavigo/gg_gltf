// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// The root nodes of a scene.
class Scene {
  /// The root nodes of a scene.
  final GgList<GltfNode> nodes;

  /// The name of the scene
  final String name;

  /// Scene constructor
  Scene({
    required this.name,
    required List<GltfNode> nodes,
  }) : nodes = GgList.fromList(nodes) {
    _hashCode = name.hashCode ^ nodes.hashCode;
  }

  @override
  int get hashCode => _hashCode;

  @override
  bool operator ==(Object other) => other.hashCode == hashCode;

  // ...........................................................................
  /// Returns an example [SceneJson] instance for test purposes.
  static Scene example = Scene(
    name: 'exampleScene',
    nodes: GgList.fromList([
      GltfNode.example,
    ]),
  );

  late final int _hashCode;
}
