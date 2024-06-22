// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

import 'package:gg_gltf/gg_gltf.dart';
import 'package:test/test.dart';

void main() {
  group('Exporter', () {
    group('export(rootNode, directory, name)', () {
      group('should export', () {
        group('a node containing simple triangle', () {
          test('with a color', () async {
            final exporter = Exporter();
            expect(exporter, isNotNull);
            await exporter.export(
              scenes: [
                ExampleScenes.triangle(),
              ],
              directory: 'test/exporter/generated',
              name: 'triangle',
            );
          });
        });

        group('a node containing simple rectangle', () {
          test('with a color', () async {
            final exporter = Exporter();
            expect(exporter, isNotNull);
            await exporter.export(
              scenes: [
                ExampleScenes.rectangle(),
              ],
              directory: 'test/exporter/generated',
              name: 'rectangle',
            );
          });
        });

        group('a node containing simple cuboid', () {
          test('with a color', () async {
            final exporter = Exporter();
            expect(exporter, isNotNull);
            await exporter.export(
              scenes: [
                ExampleScenes.cuboid(),
              ],
              directory: 'test/exporter/generated',
              name: 'cuboid',
            );
          });
        });

        group('a node containing cuboid composed of four primitives', () {});

        group('a corpus composed of four cuboid nodes', () {});
      });
    });

    group('special cases', () {
      group('should share', () {
        test('same accessors between primitives', () {});
        test('same meshes between nodes', () {});

        test('same nodes between scenes', () {});

        test('same child nodes between nodes', () {});
      });
    });
  });
}
