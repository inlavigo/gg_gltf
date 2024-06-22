// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// Example scenes for test purposes
class ExampleScenes {
  /// Returns a scene with a triangle
  static Scene triangle() => Scene(
        name: 'triangle',
        nodes: GgList.fromList([
          ExampleNodes.triangle(),
        ]),
      );

  /// Returns a scene with a rectangle
  static Scene rectangle() => Scene(
        name: 'rectangle',
        nodes: GgList.fromList([
          ExampleNodes.rectangle(),
        ]),
      );

  /// Returns a scene with a cuboid
  static Scene cuboid() => Scene(
        name: 'cuboid',
        nodes: GgList.fromList([
          ExampleNodes.cuboid(),
        ]),
      );
}
