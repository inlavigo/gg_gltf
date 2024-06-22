// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accessor_json.g.dart';

/// A typed view into a bufferView.
@JsonSerializable(includeIfNull: false)
class AccessorJson {
  /// The index of the bufferView.
  final int bufferView;

  /// The offset relative to the start of the bufferView in bytes.
  final int byteOffset;

  /// The datatype of components in the attribute.
  final int componentType;

  /// The number of attributes referenced by this accessor.
  final int count;

  /// The datatype of components in the attribute.
  final String type;

  /// The minimum value of each component in this attribute.
  final List<num> min;

  /// The maximum value of each component in this attribute.
  final List<num> max;

  /// Accessor constructor
  const AccessorJson({
    required this.bufferView,
    required this.byteOffset,
    required this.componentType,
    required this.count,
    required this.type,
    required this.min,
    required this.max,
  });

  /// Creates a new [AccessorJson] from a json map.
  factory AccessorJson.fromJson(Map<String, dynamic> json) =>
      _$AccessorJsonFromJson(json);

  /// Converts this [AccessorJson] to a json map.
  Map<String, dynamic> toJson() => _$AccessorJsonToJson(this);

  /// Returns an example [AccessorJson] instance
  static AccessorJson get example => GltfJson.example.accessors[0];

  @override
  bool operator ==(Object other) {
    if (other is! AccessorJson) return false;
    AccessorJson accessor = other;
    return accessor.bufferView == bufferView &&
        accessor.byteOffset == byteOffset &&
        accessor.componentType == componentType &&
        accessor.count == count &&
        accessor.type == type;
  }

  @override
  int get hashCode =>
      bufferView.hashCode ^
      byteOffset.hashCode ^
      componentType.hashCode ^
      count.hashCode ^
      type.hashCode;
}
