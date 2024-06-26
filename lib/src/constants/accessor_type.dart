// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

/// Accessor types.
class AccessorType {
  /// Scalar
  static const String scalar = 'SCALAR';

  /// Vec2
  static const String vec2 = 'VEC2';

  /// Vec3
  static const String vec3 = 'VEC3';

  /// Vec4
  static const String vec4 = 'VEC4';

  /// Returns the stride for the given type.
  int stride(String type) => switch (type) {
        'indices' => 1,
        'normals' => 3,
        'positions' => 3,
        'tangents' => 4,
        'textureCoordinates' => 2,
        'colors' => 4,
        _ => throw ArgumentError('Unknown type: $type'),
      };
}
