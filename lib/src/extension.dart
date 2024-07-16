import 'package:flutter/material.dart';
import 'package:flutter_device_config/config.dart';

extension DeviceHelper on BuildContext {
  MediaQueryData get _ => MediaQuery.of(this);

  Size get _size => _.size;

  double get _cx => _size.width;

  double get _cy => _size.height;

  Device get device => DeviceConfig.i.device(_cx, _cy);

  DeviceType get deviceType => device.type;

  DimensionSize get dimension {
    return DimensionSize(_cx, _cy, DeviceConfig.assumedSize(_size));
  }

  Device deviceFromType(DeviceType type) => DeviceConfig.i.deviceFromType(type);

  double dp(double value, [DimensionScaleMode? scaleMode]) {
    return dimension.diagonal(_size, value, scaleMode);
  }

  double dx(double value, [DimensionScaleMode? scaleMode]) {
    return dimension.getWidth(_cx, value, scaleMode);
  }

  double dy(double value, [DimensionScaleMode? scaleMode]) {
    return dimension.getHeight(_cy, value, scaleMode);
  }
}
