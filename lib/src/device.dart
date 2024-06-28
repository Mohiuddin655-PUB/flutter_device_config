import 'package:flutter/material.dart';

import 'constants.dart';
import 'type.dart';

/// A class representing device information such as screen dimensions and font variants.
class Device extends Size {
  final DeviceType type;
  final double fontScaleFactor;
  final double radiusScaleFactor;
  final double sizeScaleFactor;
  final double spacingScaleFactor;
  final double weightScaleFactor;

  /// Constructs a new instance of [Device] with specified dimensions and optional parameters.
  const Device._({
    required double width,
    double? height,
    required this.type,
    required this.fontScaleFactor,
    required this.radiusScaleFactor,
    required this.sizeScaleFactor,
    required this.spacingScaleFactor,
    required this.weightScaleFactor,
  }) : super(width, height ?? double.infinity);

  const Device.watch({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.watch,
          width: width ?? DeviceBreakpoints.watch,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.watch,
          radiusScaleFactor:
              radiusScaleFactor ?? DeviceRadiusScaleFactors.watch,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.watch,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.watch,
          weightScaleFactor:
              weightScaleFactor ?? DeviceWeightScaleFactors.watch,
        );

  const Device.mobile({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.mobile,
          width: width ?? DeviceBreakpoints.mobile,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.mobile,
          radiusScaleFactor:
              radiusScaleFactor ?? DeviceRadiusScaleFactors.mobile,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.mobile,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.mobile,
          weightScaleFactor:
              weightScaleFactor ?? DeviceWeightScaleFactors.mobile,
        );

  const Device.tablet({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.tablet,
          width: width ?? DeviceBreakpoints.tablet,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.tablet,
          radiusScaleFactor:
              radiusScaleFactor ?? DeviceRadiusScaleFactors.tablet,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.tablet,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.tablet,
          weightScaleFactor:
              weightScaleFactor ?? DeviceWeightScaleFactors.tablet,
        );

  const Device.laptop({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.laptop,
          width: width ?? DeviceBreakpoints.laptop,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.laptop,
          radiusScaleFactor:
              radiusScaleFactor ?? DeviceRadiusScaleFactors.laptop,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.laptop,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.laptop,
          weightScaleFactor:
              weightScaleFactor ?? DeviceWeightScaleFactors.laptop,
        );

  const Device.desktop({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.desktop,
          width: width ?? DeviceBreakpoints.desktop,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.desktop,
          radiusScaleFactor:
              radiusScaleFactor ?? DeviceRadiusScaleFactors.desktop,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.desktop,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.desktop,
          weightScaleFactor:
              weightScaleFactor ?? DeviceWeightScaleFactors.desktop,
        );

  const Device.tv({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
  }) : this._(
          height: height,
          type: DeviceType.tv,
          width: width ?? DeviceBreakpoints.tv,
          fontScaleFactor: fontScaleFactor ?? DeviceFontScaleFactors.tv,
          radiusScaleFactor: radiusScaleFactor ?? DeviceRadiusScaleFactors.tv,
          sizeScaleFactor: sizeScaleFactor ?? DeviceSizeScaleFactors.tv,
          spacingScaleFactor:
              spacingScaleFactor ?? DeviceSpacingScaleFactors.tv,
          weightScaleFactor: weightScaleFactor ?? DeviceWeightScaleFactors.tv,
        );

  factory Device.from(DeviceType type, [double? height]) {
    return Device._(
      width: type.width,
      fontScaleFactor: type.fontScaleFactor,
      radiusScaleFactor: type.radiusScaleFactor,
      sizeScaleFactor: type.sizeScaleFactor,
      spacingScaleFactor: type.spacingScaleFactor,
      weightScaleFactor: type.weightScaleFactor,
      type: type,
      height: height,
    );
  }

  Device copy({
    double? width,
    double? height,
    double? fontScaleFactor,
    double? radiusScaleFactor,
    double? sizeScaleFactor,
    double? spacingScaleFactor,
    double? weightScaleFactor,
    DeviceType? type,
  }) {
    return Device._(
      width: width ?? this.width,
      height: height ?? this.height,
      type: type ?? this.type,
      fontScaleFactor: fontScaleFactor ?? this.fontScaleFactor,
      radiusScaleFactor: radiusScaleFactor ?? this.radiusScaleFactor,
      sizeScaleFactor: sizeScaleFactor ?? this.sizeScaleFactor,
      spacingScaleFactor: spacingScaleFactor ?? this.spacingScaleFactor,
      weightScaleFactor: weightScaleFactor ?? this.weightScaleFactor,
    );
  }

  @override
  double get width => _apply(super.width);

  @override
  double get height => _apply(super.height);

  double get ration => ratio(width, height);

  double _apply(double value) => value > 100 ? value : value * 100;

  double rationalWidth(double cx) => cx * ration;

  double rationalHeight(double cy) => cy * ration;

  double ratioX(double cx) => rationalWidth(cx) / 100;

  double ratioY(double cy) => rationalHeight(cy) / 100;

  double ratio(double cx, double cy) => Size(cx, cy).aspectRatio;

  double dp(double value) => value * sizeScaleFactor;

  double sp(double value) => value * fontScaleFactor;

  @override
  String toString() {
    return "${type.name}(X: $width, Y: $height)";
  }
}
