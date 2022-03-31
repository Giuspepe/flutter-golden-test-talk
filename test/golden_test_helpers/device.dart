// Copied and adapted from https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/device.dart

import 'package:flutter/material.dart';

/// This [Device] is a configuration for golden test.
class Device {
  /// This [Device] is a configuration for golden test.
  const Device({
    required this.size,
    required this.name,
    this.devicePixelRatio = 1.0,
    this.textScaleFactor = 1.0,
    this.brightness = Brightness.light,
    this.safeArea = const EdgeInsets.all(0),
  });

  Device get landscape => Device(
      name: '${this.name}_landscape',
      size: this.size.flipped,
      devicePixelRatio: this.devicePixelRatio,
      safeArea: EdgeInsets.only(
        left: this.safeArea.top,
        top: this.safeArea.right,
        right: this.safeArea.bottom,
        bottom: this.safeArea.left,
      ));

  static const Device verySmallPhone =
      Device(size: Size(250, 500), name: 'very_small_phone');

  /// [iphone11] matches specs of iPod Touch 7th Generation, but with lower DPI for performance
  static const Device ipod = Device(
    name: 'ipod',
    size: Size(320, 568),
    devicePixelRatio: 1.0,
    safeArea: EdgeInsets.only(top: 20),
  );

  /// [iphone11] matches specs of iphone11, but with lower DPI for performance
  static const Device iphone11 = Device(
    name: 'iphone11',
    size: Size(414, 896),
    devicePixelRatio: 1.0,
    safeArea: EdgeInsets.only(top: 48, bottom: 34),
  );

  /// [tablet] example of tablet (portrait mode)
  static const Device tablet =
      Device(name: 'tablet', size: Size(1024, 1366));

  /// [name] specify device name. Ex: Phone, Tablet, Watch
  final String name;

  /// [size] specify device screen size. Ex: Size(1366, 1024))
  final Size size;

  /// [devicePixelRatio] specify device Pixel Ratio
  final double devicePixelRatio;

  /// [textScaleFactor] specify custom text scale factor
  final double textScaleFactor;

  /// [brightness] specify platform brightness
  final Brightness brightness;

  /// [safeArea] specify insets to define a safe area
  final EdgeInsets safeArea;

  /// [copyWith] convenience function for [Device] modification
  Device copyWith({
    Size? size,
    double? devicePixelRatio,
    String? name,
    double? textScale,
    Brightness? brightness,
    EdgeInsets? safeArea,
  }) {
    return Device(
      size: size ?? this.size,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
      name: name ?? this.name,
      textScaleFactor: textScale ?? this.textScaleFactor,
      brightness: brightness ?? this.brightness,
      safeArea: safeArea ?? this.safeArea,
    );
  }

  /// [dark] convenience method to copy the current device and apply dark theme
  Device dark() {
    return Device(
      size: size,
      devicePixelRatio: devicePixelRatio,
      textScaleFactor: textScaleFactor,
      brightness: Brightness.dark,
      safeArea: safeArea,
      // ignore: unnecessary_string_escapes
      name: '$name\_dark',
    );
  }

  @override
  String toString() {
    return 'Device: $name, '
        '${size.width}x${size.height} @ $devicePixelRatio, '
        'text: $textScaleFactor, $brightness, safe: $safeArea';
  }
}
