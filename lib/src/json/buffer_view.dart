// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buffer_view.g.dart';

/// A view into a buffer.
@JsonSerializable()
class BufferView {
  /// The index of the buffer.
  final int buffer;

  /// The offset relative to the start of the buffer in bytes.
  final int byteOffset;

  /// The length of the bufferView in bytes.
  final int byteLength;

  /// The stride, in bytes, between attributes referenced by this accessor.
  final int? byteStride;

  /// BufferView constructor
  const BufferView({
    required this.buffer,
    required this.byteOffset,
    required this.byteLength,
    this.byteStride,
  });

  @override
  bool operator ==(Object other) {
    if (other is! BufferView) return false;
    BufferView bufferView = other;
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

  /// Creates a new [BufferView] from a json map.
  factory BufferView.fromJson(Map<String, dynamic> json) =>
      _$BufferViewFromJson(json);

  /// Converts this [BufferView] to a json map.
  Map<String, dynamic> toJson() => _$BufferViewToJson(this);

  // ...........................................................................
  /// Returns an example [BufferView] instance for test purposes.
  static BufferView get example => Gltf.example.bufferViews![1];
}
