import 'dart:ui';

import 'device.dart';
import 'dimen.dart';
import 'type.dart';

/// A class representing configuration for different devices.
class DeviceConfig {
  final DimensionScaleMode scaleMode;
  final Device watch, mobile, tablet, laptop, desktop, tv;

  static DeviceConfig? _i;

  static DeviceConfig get i => _i ??= const DeviceConfig();

  static DimensionScaleMode get mode {
    return _i?.scaleMode ?? DimensionScaleMode.minimum;
  }

  static Size? assumedSize(Size size) {
    return _i?.device(size.width, size.height).assumedSize;
  }

  static DeviceConfig init({
    DimensionScaleMode scaleMode = DimensionScaleMode.minimum,
    Device watch = const Device.watch(),
    Device mobile = const Device.mobile(),
    Device tablet = const Device.tablet(),
    Device laptop = const Device.laptop(),
    Device desktop = const Device.desktop(),
    Device tv = const Device.tv(),
  }) {
    _i = DeviceConfig(
      scaleMode: scaleMode,
      watch: watch,
      mobile: mobile,
      tablet: tablet,
      laptop: laptop,
      desktop: desktop,
      tv: tv,
    );
    return i;
  }

  void createInstance() => _i = this;

  /// Constructs a new instance of [DeviceConfig].
  ///
  /// The parameters [mobile], [tablet], [laptop], [desktop], and [tv] represent
  /// configurations for different types of devices.
  const DeviceConfig({
    this.scaleMode = DimensionScaleMode.minimum,
    this.watch = const Device.watch(),
    this.mobile = const Device.mobile(),
    this.tablet = const Device.tablet(),
    this.laptop = const Device.laptop(),
    this.desktop = const Device.desktop(),
    this.tv = const Device.tv(),
  });

  /// Checks if the given coordinates represent a watch device.
  bool isWatch(double cx, [double? cy]) => isDevice(watch, cx, cy);

  /// Checks if the given coordinates represent a mobile device.
  bool isMobile(double cx, [double? cy]) => isDevice(mobile, cx, cy);

  /// Checks if the given coordinates represent a tab device.
  bool isTablet(double cx, [double? cy]) => isDevice(tablet, cx, cy);

  /// Checks if the given coordinates represent a laptop device.
  bool isLaptop(double cx, [double? cy]) => isDevice(laptop, cx, cy);

  /// Checks if the given coordinates represent a desktop device.
  bool isDesktop(double cx, [double? cy]) => isDevice(desktop, cx, cy);

  /// Checks if the given coordinates represent any configured device.
  bool isDevice(Device device, double cx, [double? cy]) {
    return device.type == this.device(cx, cy).type;
  }

  /// Determines the type of the device based on the given coordinates.
  Device device(double cx, [double? cy]) {
    if (cx <= watch.width) {
      return watch;
    } else if (cx <= mobile.width) {
      return mobile;
    } else if (cx <= tablet.width) {
      return tablet;
    } else if (cx <= laptop.width) {
      return laptop;
    } else if (cx <= desktop.width) {
      return desktop;
    } else {
      return tv;
    }
  }

  Device deviceFromType(DeviceType type) {
    switch (type) {
      case DeviceType.watch:
        return watch;
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.laptop:
        return laptop;
      case DeviceType.desktop:
        return desktop;
      case DeviceType.tv:
        return tv;
    }
  }
}
