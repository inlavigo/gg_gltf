// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buffer.g.dart';

/// A buffer points to binary geometry, animation, or skins.
@JsonSerializable()
class Buffer {
  /// The uri of the buffer.
  final String uri;

  /// The length of the buffer in bytes.
  final int byteLength;

  /// Buffer constructor
  const Buffer({required this.uri, required this.byteLength});

  /// Creates a new [Buffer] from a json map.
  factory Buffer.fromJson(Map<String, dynamic> json) => _$BufferFromJson(json);

  /// Converts this [Buffer] to a json map.
  Map<String, dynamic> toJson() => _$BufferToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! Buffer) return false;
    Buffer buffer = other;
    return buffer.uri == uri && buffer.byteLength == byteLength;
  }

  @override
  int get hashCode => uri.hashCode ^ byteLength.hashCode;

  // ...........................................................................
  /// Returns an example [Buffer] instance for test purposes.
  static Buffer get example => Gltf.example.buffers![0];
}
