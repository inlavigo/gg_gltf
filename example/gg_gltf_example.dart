// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';

import 'package:gg_gltf/gg_gltf.dart';

void main() {
  final gltf = Gltf.example;
  final json = jsonEncode(gltf.toJson());
  final gltf2 = Gltf.fromJson(jsonDecode(json) as Map<String, dynamic>);
  assert(gltf == gltf2);
}
