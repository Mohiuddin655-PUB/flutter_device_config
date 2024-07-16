import 'dart:ui';

import 'constants.dart';

/// An enumeration representing different types of devices.
enum DeviceType {
  watch(
    name: "Watch",
    width: DeviceBreakpoints.watch,
    assumedSize: DeviceAssumedSizes.watch,
    fontScaleFactor: DeviceFontScaleFactors.watch,
    radiusScaleFactor: DeviceRadiusScaleFactors.watch,
    sizeScaleFactor: DeviceSizeScaleFactors.watch,
    spacingScaleFactor: DeviceSpacingScaleFactors.watch,
    weightScaleFactor: DeviceWeightScaleFactors.watch,
  ),
  mobile(
    name: "Mobile",
    width: DeviceBreakpoints.mobile,
    assumedSize: DeviceAssumedSizes.mobile,
    fontScaleFactor: DeviceFontScaleFactors.mobile,
    radiusScaleFactor: DeviceRadiusScaleFactors.mobile,
    sizeScaleFactor: DeviceSizeScaleFactors.mobile,
    spacingScaleFactor: DeviceSpacingScaleFactors.mobile,
    weightScaleFactor: DeviceWeightScaleFactors.mobile,
  ),
  tablet(
    name: "Tablet",
    width: DeviceBreakpoints.tablet,
    assumedSize: DeviceAssumedSizes.tablet,
    fontScaleFactor: DeviceFontScaleFactors.tablet,
    radiusScaleFactor: DeviceRadiusScaleFactors.tablet,
    sizeScaleFactor: DeviceSizeScaleFactors.tablet,
    spacingScaleFactor: DeviceSpacingScaleFactors.tablet,
    weightScaleFactor: DeviceWeightScaleFactors.tablet,
  ),
  laptop(
    name: "Laptop",
    width: DeviceBreakpoints.laptop,
    assumedSize: DeviceAssumedSizes.laptop,
    fontScaleFactor: DeviceFontScaleFactors.laptop,
    radiusScaleFactor: DeviceRadiusScaleFactors.laptop,
    sizeScaleFactor: DeviceSizeScaleFactors.laptop,
    spacingScaleFactor: DeviceSpacingScaleFactors.tablet,
    weightScaleFactor: DeviceWeightScaleFactors.laptop,
  ),
  desktop(
    name: "Desktop",
    width: DeviceBreakpoints.desktop,
    assumedSize: DeviceAssumedSizes.desktop,
    fontScaleFactor: DeviceFontScaleFactors.desktop,
    radiusScaleFactor: DeviceRadiusScaleFactors.desktop,
    sizeScaleFactor: DeviceSizeScaleFactors.desktop,
    spacingScaleFactor: DeviceSpacingScaleFactors.tablet,
    weightScaleFactor: DeviceWeightScaleFactors.desktop,
  ),
  tv(
    name: "TV",
    width: DeviceBreakpoints.tv,
    assumedSize: DeviceAssumedSizes.tv,
    fontScaleFactor: DeviceFontScaleFactors.tv,
    radiusScaleFactor: DeviceRadiusScaleFactors.tv,
    sizeScaleFactor: DeviceSizeScaleFactors.tv,
    spacingScaleFactor: DeviceSpacingScaleFactors.tablet,
    weightScaleFactor: DeviceWeightScaleFactors.tv,
  );

  final String name;
  final Size assumedSize;
  final double fontScaleFactor;
  final double radiusScaleFactor;
  final double sizeScaleFactor;
  final double spacingScaleFactor;
  final double weightScaleFactor;
  final double width;

  const DeviceType({
    required this.name,
    required this.width,
    required this.assumedSize,
    required this.fontScaleFactor,
    required this.radiusScaleFactor,
    required this.sizeScaleFactor,
    required this.spacingScaleFactor,
    required this.weightScaleFactor,
  });
}
