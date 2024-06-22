// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buffer_view_json.g.dart';

/// A view into a buffer.
@JsonSerializable(includeIfNull: false)
class BufferViewJson {
  /// The index of the buffer.
  final int buffer;

  /// The offset relative to the start of the buffer in bytes.
  final int byteOffset;

  /// The length of the bufferView in bytes.
  final int byteLength;

  /// The stride, in bytes, between attributes referenced by this accessor.
  final int? byteStride;

  /// BufferView constructor
  const BufferViewJson({
    required this.buffer,
    required this.byteOffset,
    required this.byteLength,
    this.byteStride,
  });

  @override
  bool operator ==(Object other) {
    if (other is! BufferViewJson) return false;
    BufferViewJson bufferView = other;
    return bufferView.buffer == buffer &&
        bufferView.byteOffset == byteOffset &&
        bufferView.byteLength == byteLength &&
        bufferView.byteStride == byteStride;
  }

  @override
  int get hashCode =>
      buffer.hashCode ^
      byteOffset.hashCode ^
      byteLength.hashCode ^
      byteStride.hashCode;

  /// Creates a new [BufferViewJson] from a json map.
  factory BufferViewJson.fromJson(Map<String, dynamic> json) =>
      _$BufferViewJsonFromJson(json);

  /// Converts this [BufferViewJson] to a json map.
  Map<String, dynamic> toJson() => _$BufferViewJsonToJson(this);

  // ...........................................................................
  /// Returns an example [BufferViewJson] instance for test purposes.
  static BufferViewJson get example => GltfJson.example.bufferViews[1];
}
