// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accessor.g.dart';

/// A typed view into a bufferView.
@JsonSerializable()
class Accessor {
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

  /// Accessor constructor
  const Accessor({
    required this.bufferView,
    required this.byteOffset,
    required this.componentType,
    required this.count,
    required this.type,
  });

  /// Creates a new [Accessor] from a json map.
  factory Accessor.fromJson(Map<String, dynamic> json) =>
      _$AccessorFromJson(json);

  /// Converts this [Accessor] to a json map.
  Map<String, dynamic> toJson() => _$AccessorToJson(this);

  /// Returns an example [Accessor] instance
  static Accessor get example => Gltf.example.accessors![0];

  @override
  bool operator ==(Object other) {
    if (other is! Accessor) return false;
    Accessor accessor = other;
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
