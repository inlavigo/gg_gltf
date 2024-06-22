// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:gg_gltf/gg_gltf.dart';
import 'package:gg_list/gg_list.dart';

const _enableTangents = false;
const _enableTextures = false;

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

    final buffers = _Objects();
    final primitives = <Primitive>[];
    final meshes = <Mesh>[];
    final nodes = <Node>[];

    _collectPrimitives(primitives, scenes);
    _collectMeshes(meshes, scenes);
    _collectBuffersAndAccessors(json, primitives, buffers);
    _collectNodes(scenes, nodes);
    _writeAccessorsToJson(buffers, json);
    _writeBufferViewsToJson(buffers, json);
    _writeBinaryDataToJson(buffers, json);
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
    _Objects buffers,
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
    _Objects objects,
  ) {
    _collectData(primitive.indices, objects, 'indices', primitive);
    _collectData(primitive.normals, objects, 'normals', primitive);
    _collectData(primitive.positions, objects, 'positions', primitive);

    // coverage:ignore-start
    if (_enableTangents) {
      _collectData(primitive.tangents, objects, 'tangents', primitive);
    }

    if (_enableTextures) {
      _collectData(
        primitive.textureCoordinates,
        objects,
        'textureCoordinates',
        primitive,
      );
    }
    // coverage:ignore-end
    _collectData(primitive.colors, objects, 'colors', primitive);
  }

  // ...........................................................................
  void _collectData(
    GgList<num> data,
    _Objects objects,
    String type,
    Primitive primitive,
  ) {
    // Check
    assert(data.data is TypedData);
    if (data.isEmpty) return;

    // Calc stride
    int stride = AccessorType().stride(type);

    // Add buffer when not yet staged
    final buffer = _addbuffer(objects, stride, data, type);

    // Add buffer view
    _addBufferView(objects, stride, type, buffer);

    // Add accessor
    _addAccessor(objects, type, data, primitive, stride);
  }

  // ...........................................................................
  void _addAccessor(
    _Objects objects,
    String type,
    GgList<num> data,
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

    final bufferViewIndex = objects.bufferViews.length - 1;

    final accessor = AccessorJson(
      bufferView: bufferViewIndex,
      byteOffset: 0,
      componentType: componentType,
      count: data.length ~/ stride,
      type: gltfType,
      min: min,
      max: max,
    );

    objects.accessors.add(accessor);
    objects.primitiveAccessors.add(
      _PrimitiveAccessor(
        primitive: primitive,
        accessor: accessor,
        accessorIndex: objects.accessors.length - 1,
        type: type,
      ),
    );
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
  _Buffer _addbuffer(
    _Objects objects,
    int stride,
    GgList<num> data,
    String type,
  ) {
    if (type == 'indices') {
      print(1);
    }

    // Calc byte offset
    final byteOffset = objects.byteOffset;
    final componentTypeLength =
        (data.data as TypedData).elementSizeInBytes * stride;
    final byteOffsetAligned = byteOffset + (byteOffset % componentTypeLength);

    // Create buffer
    final buffer = _Buffer(
      data: data,
      byteOffset: byteOffsetAligned,
    );

    // Add buffer
    final existingBuffer = objects.buffers.lookup(buffer);
    if (existingBuffer == null) {
      objects.buffers.add(buffer);
    }

    return existingBuffer ?? buffer;
  }

  // ...........................................................................
  void _addBufferView(
    _Objects objects,
    int stride,
    String type,
    _Buffer buffer,
  ) {
    final bufferView = _BufferView(
      type: type,
      bufferView: BufferViewJson(
        buffer: 0, // We only have one buffer
        byteOffset: buffer.byteOffset,
        byteLength: buffer.byteSize,
      ),
    );

    objects.bufferViews.add(bufferView);
  }

  // ...........................................................................
  void _writeAccessorsToJson(_Objects objects, GltfJson gltfJson) {
    gltfJson.accessors.addAll(objects.accessors);
  }

  // ...........................................................................
  void _writeBufferViewsToJson(_Objects objects, GltfJson gltfJson) {
    gltfJson.bufferViews.addAll(
      objects.bufferViews.map(
        (e) => e.bufferView,
      ),
    );
  }

  // ...........................................................................
  void _writeBinaryDataToJson(_Objects objects, GltfJson gltfJson) {
    // Estimate the buffer byte length
    final lastBuffer = objects.buffers.last;
    final byteCount = objects.byteOffset;
    assert(byteCount == lastBuffer.byteOffsetAfter);

    // Concatenate the buffers
    var bytes = ByteData(byteCount);

    for (final buffer in objects.buffers) {
      bytes.buffer.asUint8List().setAll(
            buffer.byteOffset,
            (buffer.data.data as TypedData).buffer.asUint8List(),
          );
    }

    // Encode the buffer to base64
    final bufferBytes = bytes.buffer.asUint8List();
    final bufferBase64 = base64.encode(bufferBytes);

    // Create the buffer
    final buffer = BufferJson(
      byteLength: objects.byteOffset,
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
    _Objects objects,
    List<Mesh> meshes,
    GltfJson gltfJson,
  ) {
    for (final mesh in meshes) {
      final primitives = <PrimitiveJson>[];
      for (final p in mesh.primitives) {
        // Write indices
        final accessors =
            objects.primitiveAccessors.where((pa) => pa.primitive == p);

        int accessor(String type) => accessors
            .firstWhere(
              (pa) => pa.type == type,
            )
            .accessorIndex;

        final attributes = <String, int>{
          'NORMAL': accessor('normals'),
          'POSITION': accessor('positions'),
          // coverage:ignore-start
          if (_enableTangents) 'TANGENT': accessor('tangents'),
          if (_enableTextures) 'TEXCOORD_0': accessor('textureCoordinates'),
          // coverage:ignore-end
          'COLOR_0': accessor('colors'),
        };

        final primitiveJson = PrimitiveJson(
          attributes: attributes,
          indices: accessor('indices'),
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

// .............................................................................
class _Buffer {
  _Buffer({required this.data, required this.byteOffset});
  final GgList<num> data;
  final int byteOffset;
  int get byteOffsetAfter =>
      byteOffset + (data.data as TypedData).lengthInBytes;
  int get byteSize => (data.data as TypedData).lengthInBytes;

  @override
  // TODO: implement hashCode
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is _Buffer) {
      return data.hashCode == other.data.hashCode;
    }
    return false;
  }
}

// .............................................................................
class _PrimitiveAccessor {
  _PrimitiveAccessor({
    required this.primitive,
    required this.accessor,
    required this.accessorIndex,
    required this.type,
  });

  final Primitive primitive;
  final AccessorJson accessor;
  final int accessorIndex;
  final String type;
}

class _BufferView {
  _BufferView({
    required this.bufferView,
    required this.type,
  });

  final BufferViewJson bufferView;
  final String type;
}

// .............................................................................
class _Objects {
  final LinkedHashSet<_Buffer> buffers = LinkedHashSet<_Buffer>();
  final List<_BufferView> bufferViews = [];
  final List<AccessorJson> accessors = [];
  final List<_PrimitiveAccessor> primitiveAccessors = [];

  int get byteOffset => buffers.isEmpty ? 0 : buffers.last.byteOffsetAfter;
}
