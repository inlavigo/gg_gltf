// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:json_annotation/json_annotation.dart';
part 'asset_json.g.dart';

/// Metadata about the glTF asset.
@JsonSerializable(includeIfNull: false)
class AssetJson {
  /// The glTF version.
  final String version;

  /// The glTF generator.
  final String? generator;

  /// Asset constructor
  const AssetJson({required this.version, this.generator});

  /// Creates a new [AssetJson] from a json map.
  factory AssetJson.fromJson(Map<String, dynamic> json) =>
      _$AssetJsonFromJson(json);

  /// Converts this [AssetJson] to a json map.
  Map<String, dynamic> toJson() => _$AssetJsonToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is! AssetJson) return false;
    AssetJson asset = other;
    return asset.version == version && asset.generator == generator;
  }

  @override
  int get hashCode => version.hashCode ^ generator.hashCode;

  // ...........................................................................
  /// Returns an example [AssetJson] instance for test purposes.
  static AssetJson get example => GltfJson.example.asset;
}
