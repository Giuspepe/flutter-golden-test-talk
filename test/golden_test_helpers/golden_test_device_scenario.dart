import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'device.dart';

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
      name: '$name (device: ${device.name})',
      // clip shadows
      child: ClipRect(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            size: device.size,
            padding: device.safeArea,
            platformBrightness: device.brightness,
            devicePixelRatio: device.devicePixelRatio,
            textScaleFactor: device.textScaleFactor,
          ),
          child: SizedBox(
            height: device.size.height,
            width: device.size.width,
            child: builder(),
          ),
        ),
      ),
    );
  }
}
