// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';
part 'asset.g.dart';

/// Metadata about the glTF asset.
@JsonSerializable()
class Asset {
  /// The glTF version.
  final String version;

  /// The glTF generator.
  final String? generator;

  /// Asset constructor
  const Asset({required this.version, this.generator});

  /// Creates a new [Asset] from a json map.
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  /// Converts this [Asset] to a json map.
  Map<String, dynamic> toJson() => _$AssetToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! Asset) return false;
    Asset asset = other;
    return asset.version == version && asset.generator == generator;
  }

  @override
  int get hashCode => version.hashCode ^ generator.hashCode;

  // ...........................................................................
  /// Returns an example [Asset] instance for test purposes.
  static Asset get example => Gltf.example.asset;
}
