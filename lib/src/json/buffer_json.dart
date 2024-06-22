// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buffer_json.g.dart';

/// A buffer points to binary geometry, animation, or skins.
@JsonSerializable()
class BufferJson {
  /// The uri of the buffer.
  final String uri;

  /// The length of the buffer in bytes.
  final int byteLength;

  /// Buffer constructor
  const BufferJson({required this.uri, required this.byteLength});

  /// Creates a new [BufferJson] from a json map.
  factory BufferJson.fromJson(Map<String, dynamic> json) =>
      _$BufferJsonFromJson(json);

  /// Converts this [BufferJson] to a json map.
  Map<String, dynamic> toJson() => _$BufferJsonToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! BufferJson) return false;
    BufferJson buffer = other;
    return buffer.uri == uri && buffer.byteLength == byteLength;
  }

  @override
  int get hashCode => uri.hashCode ^ byteLength.hashCode;

  // ...........................................................................
  /// Returns an example [BufferJson] instance for test purposes.
  static BufferJson get example => GltfJson.example.buffers[0];
}
