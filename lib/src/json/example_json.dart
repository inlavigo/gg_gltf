// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';

/// Example JSON string.
const exampleJson = '''
{
   "accessors" : [
      {
        "name": "indices",
         "bufferView" : 0,
         "byteOffset" : 0,
         "componentType" : ${ComponentTypes.unsignedShort},
         "count" : 36,
         "max" : [
            35
         ],
         "min" : [
            0
         ],
         "type": "${AccessorType.scalar}"
      },
      {
        "name": "POSITION",
         "bufferView" : 1,
         "byteOffset" : 0,
         "componentType" : ${ComponentTypes.float},
         "count" : 36,
         "max" : [
            1.000000,
            1.000000,
            1.000001
         ],
         "min" : [
            -1.000000,
            -1.000000,
            -1.000000
         ],
         "type" : "${AccessorType.vec3}"
      },
      {
        "name": "NORMAL",
         "bufferView" : 2,
         "byteOffset" : 0,
         "componentType" : ${ComponentTypes.float},
         "count" : 36,
         "max" : [
            1.000000,
            1.000000,
            1.000000
         ],
         "min" : [
            -1.000000,
            -1.000000,
            -1.000000
         ],
         "type" : "${AccessorType.vec3}"
      },
      {
        "name": "TANGENT",
         "bufferView" : 3,
         "byteOffset" : 0,
         "componentType" : ${ComponentTypes.float},
         "count" : 36,
         "max" : [
            1.000000,
            -0.000000,
            -0.000000,
            1.000000
         ],
         "min" : [
            0.000000,
            -0.000000,
            -1.000000,
            -1.000000
         ],
         "type" : "VEC4"
      },
      {
        "name": "TEXCOORD_0",
         "bufferView" : 4,
         "byteOffset" : 0,
         "componentType" : ${ComponentTypes.float},
         "count" : 36,
         "max" : [
            1.000000,
            1.000000
         ],
         "min" : [
            -1.000000,
            -1.000000
         ],
         "type" : "VEC2"
      }
   ],
   "asset" : {
      "generator" : "VKTS glTF 2.0 exporter",
      "version" : "2.0"
   },
   "bufferViews" : [
      {
         "name": "indices",
         "buffer" : 0,
         "byteLength" : 72,
         "byteOffset" : 0,
         "target" : 34963
      },
      {
        "name": "POSITION",
         "buffer" : 0,
         "byteLength" : 432,
         "byteOffset" : 72,
         "target" : ${BufferViewTargets.arrayBuffer}
      },
      {
        "name": "NORMAL",
         "buffer" : 0,
         "byteLength" : 432,
         "byteOffset" : 504,
         "target" : ${BufferViewTargets.arrayBuffer}
      },
      {
        "name": "TANGENT",
         "buffer" : 0,
         "byteLength" : 576,
         "byteOffset" : 936,
         "target" : ${BufferViewTargets.arrayBuffer}
      },
      {
         "name": "TEXCOORD_0",
         "buffer" : 0,
         "byteLength" : 288,
         "byteOffset" : 1512,
         "target" : ${BufferViewTargets.arrayBuffer}
      }
   ],
   "buffers" : [
      {
         "byteLength" : 1800,
         "uri" : "cube_new.bin"
      }
   ],
   "images" : [
      {
         "uri" : "Cube_BaseColor.png"
      },
      {
         "uri" : "Cube_MetallicRoughness.png"
      }
   ],
   "materials" : [
      {
         "name" : "Cube",
         "pbrMetallicRoughness" : {
            "baseColorTexture" : {
               "index" : 0
            },
            "metallicRoughnessTexture" : {
               "index" : 1
            }
         }
      }
   ],
   "meshes" : [
      {
         "name" : "Cube",
         "primitives" : [
            {
               "attributes" : {
                  "NORMAL" : 2,
                  "POSITION" : 1,
                  "TANGENT" : 3,
                  "TEXCOORD_0" : 4
               },
               "indices" : 0,
               "material" : 0,
               "mode" : ${RenderModes.triangles}
            }
         ]
      }
   ],
   "nodes" : [
      {
         "mesh" : 0,
         "name" : "Cube"
      }
   ],
   "samplers" : [
      {}
   ],
   "scene" : 0,
   "scenes" : [
      {
         "nodes" : [
            0
         ]
      }
   ],
   "textures" : [
      {
         "sampler" : 0,
         "source" : 0
      },
      {
         "sampler" : 0,
         "source" : 1
      }
   ]
}

''';
