import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('ListTile Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'alchemist_sample',
      constraints: const BoxConstraints(maxWidth: 600),
      builder: () => GoldenTestGroup(
        columnWidthBuilder: (_) => const FlexColumnWidth(),
        children: [
          GoldenTestScenario(
            name: 'with title',
            child: const ListTile(
              title: Text('ListTile.title'),
            ),
          ),
          GoldenTestScenario(
            name: 'with title and subtitle',
            child: const ListTile(
              title: Text('ListTile.title'),
              subtitle: Text('ListTile.subtitle'),
            ),
          ),
          GoldenTestScenario(
            name: 'with trailing icon',
            child: const ListTile(
              title: Text('ListTile.title'),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ),
        ],
      ),
    );
  });
}
