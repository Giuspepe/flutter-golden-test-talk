import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golden_test_talk/src/app.dart';
import 'package:flutter_golden_test_talk/src/settings/settings_controller.dart';
import 'package:flutter_golden_test_talk/src/settings/settings_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart' show loadAppFonts;

import 'golden_test_helpers/device.dart';
import 'golden_test_helpers/golden_test_device_scenario.dart';

Future<void> main() async {
  const devices = [Device.tablet, Device.iphone11, Device.ipod];

  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  Widget buildWidgetUnderTest() {
    return MyApp(settingsController: settingsController);
  }

  setUpAll(() async {
    await loadAppFonts();
  });

  for (final device in devices) {
    goldenTest(
      'app golden test (on ${device.name})',
      fileName: 'app_${device.name}',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestDeviceScenario(
            device: device,
            name: 'app',
            builder: buildWidgetUnderTest,
          )
        ],
      ),
    );
  }
}
