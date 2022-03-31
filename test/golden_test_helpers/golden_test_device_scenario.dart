import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'device.dart';

// TODO(Giuseppe): issue/vorschlag/PR für alchemist?

/// Wrapper for testing screens with device constraints in [GoldenTestGroup]s
///
/// [GoldenTestGroup] on its own passes no size constraints down the widget tree,
/// but screens need constraints because they try to be as big as possible
/// which would result in an exception.
class GoldenTestDeviceScenario extends StatelessWidget {
  final String name;
  final Device device;
  final ValueGetter<Widget> builder;

  const GoldenTestDeviceScenario({
    required this.name,
    required this.builder,
    this.device = Device.iphone11,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoldenTestScenario(
      name: '${this.name} (device: ${device.name})',
      // clip shadows
      child: ClipRect(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            size: this.device.size,
            padding: this.device.safeArea,
            platformBrightness: this.device.brightness,
            devicePixelRatio: this.device.devicePixelRatio,
            textScaleFactor: this.device.textScaleFactor,
          ),
          child: SizedBox(
            height: this.device.size.height,
            width: this.device.size.width,
            child: builder(),
          ),
        ),
      ),
    );
  }
}
