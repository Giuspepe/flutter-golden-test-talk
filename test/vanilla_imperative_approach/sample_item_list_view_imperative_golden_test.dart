import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golden_test_talk/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> main() async {
  setUpAll(() async {
    await loadAppFonts();
  });

  testWidgets('should render SampleItemListView correctly',
      (WidgetTester tester) async {
    // define widget to test
    const widgetUnderTest = MaterialApp(
        debugShowCheckedModeBanner: false, home: SampleItemListView());

    // attach widget under test to the widget tree
    await tester.pumpWidget(widgetUnderTest);
    await tester.pumpAndSettle();
    // wait for images to load
    await precacheImages(tester);

    // compare rendered snapshot to golden reference image
    await expectLater(find.byType(MaterialApp),
        matchesGoldenFile('goldens/sample_item_list_view_imperative.png'));
  });
}
