import 'package:alchemist/alchemist.dart';
import 'package:flutter_golden_test_talk/src/sample_feature/sample_item_details_view.dart';
import 'package:flutter_golden_test_talk/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter_golden_test_talk/src/settings/settings_controller.dart';
import 'package:flutter_golden_test_talk/src/settings/settings_service.dart';
import 'package:flutter_golden_test_talk/src/settings/settings_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart' show loadAppFonts;

import 'golden_test_helpers/device.dart';
import 'golden_test_helpers/golden_test_device_scenario.dart';

Future<void> main() async {
  setUpAll(() async {
    await loadAppFonts();
  });

  final devices = [
    Device.tablet,
    Device.iphone11,
    Device.ipod,
    Device.ipod.landscape
  ];

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  for (final device in devices) {
    goldenTest(
      'app golden test (on ${device.name})',
      whilePerforming: (tester) async {
        await precacheImages(tester);
        return;
      },
      fileName: 'app_${device.name}',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestDeviceScenario(
            device: device,
            name: 'SettingsView',
            builder: () => SettingsView(controller: settingsController),
          ),
          GoldenTestDeviceScenario(
            device: device,
            name: 'SampleItemDetailsView',
            builder: () => const SampleItemDetailsView(),
          ),
          GoldenTestDeviceScenario(
            device: device,
            name: 'SampleItemListView',
            builder: () => const SampleItemListView(),
          ),
        ],
      ),
    );
  }
}
