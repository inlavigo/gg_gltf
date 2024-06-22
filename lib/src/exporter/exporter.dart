// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

/// A class to export a glTF asset.
class Exporter {
  /// Creates a new [Exporter] instance.
  Exporter();

  /// Exports the glTF asset to a json map.
  Future<void> export({
    required List<Scene> scenes,
    required String directory,
    required String name,
  }) async {
    final GltfJson json = GltfJson(
      asset: const AssetJson(
        version: '2.0',
      ),
      scenes: [],
      nodes: [],
      meshes: [],
      accessors: [],
      buffers: [],
      bufferViews: [],
    );

    final buffers = _Buffers();
    final primitives = <Primitive>[];
    final meshes = <Mesh>[];
    final nodes = <Node>[];

    _collectPrimitives(primitives, scenes);
    _collectMeshes(meshes, scenes);
    _collectBuffersAndAccessors(json, primitives, buffers);
    _collectNodes(scenes, nodes);
    _writeAccessorsToJson(buffers, json);
    _writeBufferViewsToJson(buffers, json);
    _writeBufferToJson(buffers, json);
    _writeMeshes(buffers, meshes, json);
    _writeNodes(nodes, meshes, json);
    _writeScenes(scenes, nodes, json);

    // Write the json to a file
    final dirExists = await Directory(directory).exists() == true;
    if (!dirExists) {
      // coverage:ignore-start
      await Directory(directory).create(recursive: true);
      // coverage:ignore-end
    }

    final file = File('$directory/$name.gltf');
    const jsonSerializer = JsonEncoder.withIndent('  ');
    await file.writeAsString(jsonSerializer.convert(json));
  }

  // ######################
  // Private
  // ######################

  // ...........................................................................
  void _collectPrimitives(List<Primitive> primitives, List<Scene> scenes) {
    for (final scene in scenes) {
      for (final node in scene.nodes) {
        _collectPrimitivesForNode(primitives, node);
      }
    }
  }

  // ...........................................................................
  void _collectPrimitivesForNode(
    List<Primitive> primitives,
    Node node,
  ) {
    for (final child in node.children) {
      _collectPrimitivesForNode(primitives, child); // coverage:ignore-line
    }

    if (node.mesh != null) {
      primitives.addAll(node.mesh!.primitives);
    }
  }

  // ...........................................................................
  void _collectBuffersAndAccessors(
    GltfJson gltfJson,
    List<Primitive> primitives,
    _Buffers buffers,
  ) {
    for (final primitive in primitives) {
      _collectPrimitiveBufferAndAccessor(primitive, buffers);
    }
  }

  // ...........................................................................
  void _collectNodes(
    List<Scene> scenes,
    List<Node> nodes,
  ) {
    for (final scene in scenes) {
      for (final node in scene.nodes) {
        _collectNodesForNode(node, nodes);
      }
    }
  }

  // ...........................................................................
  void _collectNodesForNode(
    Node node,
    List<Node> nodes,
  ) {
    final existingNode = nodes.firstWhereOrNull(
      (element) => element.hashCode == node.hashCode, // coverage:ignore-line
    );
    if (existingNode != null) {
      return;
    }

    nodes.add(node);

    for (final child in node.children) {
      _collectNodesForNode(child, nodes); // coverage:ignore-line
    }
  }

  // ...........................................................................
  void _collectPrimitiveBufferAndAccessor(
    Primitive primitive,
    _Buffers buffers,
  ) {
    _collectData(primitive.indices, buffers, 'indices', primitive);
    _collectData(primitive.normals, buffers, 'normals', primitive);
    _collectData(primitive.positions, buffers, 'positions', primitive);
    _collectData(primitive.tangents, buffers, 'tangents', primitive);
    _collectData(
      primitive.textureCoordinates,
      buffers,
      'textureCoordinates',
      primitive,
    );
    _collectData(primitive.colors, buffers, 'colors', primitive);
  }

  // ...........................................................................
  void _collectData(
    GgList<dynamic> data,
    _Buffers buffers,
    String type,
    Primitive primitive,
  ) {
    // Check
    assert(data.data is TypedData);
    if (data.isEmpty) return;

    // Did we already create a buffer view
    final hash = data.hashCode;
    late final int bufferIndex;
    if (buffers.bufferIndices.containsKey(hash)) {
      bufferIndex = buffers.bufferIndices[hash]!;
    } else {
      // Add buffer
      bufferIndex = buffers.buffers.length;
      buffers.buffers.add(data.data as TypedData);
      buffers.bufferIndices[hash] = bufferIndex;
    }

    // Calc stride
    int stride = AccessorType().stride(type);

    // Add buffer view
    _addBufferView(buffers, stride);

    // Add accessor
    _addAccessor(buffers, bufferIndex, type, data, primitive, stride);
  }

  // ...........................................................................
  void _addAccessor(
    _Buffers buffers,
    int bufferIndex,
    String type,
    GgList<dynamic> data,
    Primitive primitive,
    int stride,
  ) {
    final gltfType = switch (type) {
      'indices' => AccessorType.scalar,
      'normals' => AccessorType.vec3,
      'positions' => AccessorType.vec3,
      'tangents' => AccessorType.vec4,
      'textureCoordinates' => AccessorType.vec2,
      'colors' => AccessorType.vec4,
      _ => throw ArgumentError('Unknown type: $type'), // coverage:ignore-line
    };

    final componentType = switch (type) {
      'indices' => ComponentTypes.unsignedShort,
      'normals' => ComponentTypes.float,
      'positions' => ComponentTypes.float,
      'tangents' => ComponentTypes.float,
      'textureCoordinates' => ComponentTypes.float,
      'colors' => ComponentTypes.float,
      _ => throw ArgumentError('Unknown type: $type'), // coverage:ignore-line
    };

    final min = _minimum(data.data as List<num>, stride);
    final max = _maximum(data.data as List<num>, stride);
    assert(data.length % stride == 0);

    final accessor = AccessorJson(
      bufferView: bufferIndex,
      byteOffset: 0,
      componentType: componentType,
      count: data.length ~/ stride,
      type: gltfType,
      min: min,
      max: max,
    );

    buffers.accessors.add(accessor);
    final accessorHash = _accessorHashCode(primitive, data.hashCode);
    buffers.accessorIndices[accessorHash] = buffers.accessors.length - 1;
  }

  // ...........................................................................
  int _accessorHashCode(Primitive primitive, int dataHashCode) {
    return primitive.hashCode ^ dataHashCode;
  }

  // ...........................................................................
  List<T> _minimum<T extends num>(List<T> data, int stride) {
    final result = List<T>.filled(stride, data[0]);
    assert(data.length % stride == 0);

    for (int s = 0; s < stride; s++) {
      T min = data[s];
      for (int i = s; i < data.length; i += stride) {
        if (data[i] < min) {
          min = data[i];
        }
      }
      result[s] = min;
    }

    return result;
  }

  // ...........................................................................
  List<T> _maximum<T extends num>(List<T> data, int stride) {
    final result = List<T>.filled(stride, data[0]);
    assert(data.length % stride == 0);

    for (int s = 0; s < stride; s++) {
      T max = data[s];
      for (int i = s; i < data.length; i += stride) {
        if (data[i] > max) {
          max = data[i];
        }
      }

      result[s] = max;
    }

    return result;
  }

  // ...........................................................................
  void _addBufferView(_Buffers buffers, int stride) {
    final buffer = buffers.buffers.last;
    final byteOffset = buffers.byteOffset;
    final componentTypeLength = buffer.elementSizeInBytes * stride;
    final byteOffsetAligned = byteOffset + (byteOffset % componentTypeLength);

    final bufferView = BufferViewJson(
      buffer: 0, // We only have one buffer
      byteOffset: byteOffsetAligned,
      byteLength: buffer.lengthInBytes,
    );

    buffers.bufferViews.add(bufferView);
  }

  // ...........................................................................
  void _writeAccessorsToJson(_Buffers buffers, GltfJson gltfJson) {
    gltfJson.accessors.addAll(buffers.accessors);
  }

  // ...........................................................................
  void _writeBufferViewsToJson(_Buffers buffers, GltfJson gltfJson) {
    gltfJson.bufferViews.addAll(buffers.bufferViews);
  }

  // ...........................................................................
  void _writeBufferToJson(_Buffers buffers, GltfJson gltfJson) {
    // Estimate the buffer byte length
    final lastBuffer = buffers.bufferViews.last;
    final byteCount = lastBuffer.byteOffset + lastBuffer.byteLength;

    // Concatenate the buffers
    var bytes = ByteData(byteCount);
    for (int i = 0; i < buffers.buffers.length; i++) {
      final byteOffset = buffers.bufferViews[i].byteOffset;
      bytes.buffer.asUint8List().setAll(
            byteOffset,
            buffers.buffers[i].buffer.asUint8List(),
          );
    }

    // Encode the buffer to base64
    final bufferBytes = bytes.buffer.asUint8List();
    final bufferBase64 = base64.encode(bufferBytes);

    // Create the buffer
    final buffer = BufferJson(
      byteLength: buffers.byteOffset,
      uri: 'data:application/octet-stream;base64,$bufferBase64',
    );

    gltfJson.buffers.add(buffer);
  }

  // ...........................................................................
  void _collectMeshes(
    List<Mesh> meshes,
    List<Scene> scenes,
  ) {
    for (final scene in scenes) {
      for (final node in scene.nodes) {
        _collectMeshesForNode(meshes, node);
      }
    }
  }

  // ...........................................................................
  void _collectMeshesForNode(
    List<Mesh> meshes,
    Node node,
  ) {
    for (final child in node.children) {
      _collectMeshesForNode(meshes, child); // coverage:ignore-line
    }

    if (node.mesh != null) {
      final existingMesh = meshes.firstWhereOrNull(
        // coverage:ignore-start
        (element) => element.hashCode == node.mesh.hashCode,
        // coverage:ignore-end
      );
      if (existingMesh != null) {
        return;
      }

      meshes.add(node.mesh!);
    }
  }

  // ...........................................................................
  void _writeMeshes(
    _Buffers buffers,
    List<Mesh> meshes,
    GltfJson gltfJson,
  ) {
    for (final mesh in meshes) {
      final primitives = <PrimitiveJson>[];
      for (final p in mesh.primitives) {
        // Write indices
        final indicesIndex = buffers.bufferIndices[p.indices.hashCode]!;

        int hc(GgList<dynamic> data) => _accessorHashCode(p, data.hashCode);

        final attributes = <String, int>{
          'NORMAL': buffers.accessorIndices[hc(p.normals)]!,
          'POSITION': buffers.accessorIndices[hc(p.positions)]!,
          'TANGENT': buffers.accessorIndices[hc(p.tangents)]!,
          'TEXCOORD_0': buffers.accessorIndices[hc(p.textureCoordinates)]!,
          'COLOR_0': buffers.accessorIndices[hc(p.colors)]!,
        };

        final primitiveJson = PrimitiveJson(
          attributes: attributes,
          indices: indicesIndex,
        );

        primitives.add(primitiveJson);
      }

      // Create mesh json
      final meshJson = MeshJson(
        name: mesh.name,
        primitives: primitives,
      );

      // Add mesh to gltf
      gltfJson.meshes.add(meshJson);
    }
  }

  // ...........................................................................
  void _writeNodes(
    List<Node> nodes,
    List<Mesh> meshes,
    GltfJson gltfJson,
  ) {
    for (final node in nodes) {
      final mesh = node.mesh != null
          ? meshes.firstWhere(
              (element) => element.hashCode == node.mesh.hashCode,
            )
          : null;

      final meshIndex = mesh != null ? meshes.indexOf(mesh) : null;
      assert(meshIndex == null || meshIndex >= 0);

      final nodeJson = NodeJson(
        name: node.name,
        mesh: meshIndex,
      );

      gltfJson.nodes.add(nodeJson);
    }
  }

  // ...........................................................................
  void _writeScenes(
    List<Scene> scenes,
    List<Node> nodes,
    GltfJson gltfJson,
  ) {
    for (final scene in scenes) {
      final nodesJson = <int>[];
      for (final node in scene.nodes) {
        final existingNode = nodes.firstWhere(
          (n) => n.hashCode == node.hashCode,
        );

        final nodeIndex = nodes.indexOf(existingNode);
        assert(nodeIndex >= 0);
        nodesJson.add(nodeIndex);
      }

      final sceneJson = SceneJson(
        nodes: nodesJson,
      );

      gltfJson.scenes.add(sceneJson);
    }
  }
}

class _Buffers {
  final Map<int, int> bufferIndices = {};
  final Map<int, int> accessorIndices = {};
  final List<TypedData> buffers = [];
  final List<BufferViewJson> bufferViews = [];
  final List<AccessorJson> accessors = [];
  int get byteOffset => bufferViews.isEmpty
      ? 0
      : bufferViews.last.byteOffset + bufferViews.last.byteLength;
}
