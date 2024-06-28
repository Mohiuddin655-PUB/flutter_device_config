import 'package:flutter/material.dart';

import 'config.dart';
import 'device.dart';
import 'type.dart';

extension DeviceHelper on BuildContext {
  MediaQueryData get _ => MediaQuery.of(this);

  Size get _size => _.size;

  double get _cx => _size.width;

  double get _cy => _size.height;

  Device get device => DeviceConfig.i.device(_cx, _cy);

  DeviceType get deviceType => device.type;

  double dx(double value) => device.dp(value);

  double px(double value) => device.sp(value);
}
