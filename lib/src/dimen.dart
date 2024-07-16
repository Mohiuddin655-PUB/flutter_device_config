import 'dart:math';

import 'package:flutter/material.dart';

import '../config.dart';

enum DimensionScaleMode { minimum, maximum, both, none }

class DimensionSize extends Size {
  final Size assumedSize;

  const DimensionSize(
    super.width,
    super.height, [
    Size? assumedSize,
  ]) : assumedSize = assumedSize ?? const Size(375, 812);

  double get maximum => max(width, height);

  double get minimum => min(width, height);

  double _s(
    double definedValue,
    double suggestedValue, [
    DimensionScaleMode? mode,
  ]) {
    switch (mode ?? DeviceConfig.mode) {
      case DimensionScaleMode.minimum:
        return min(suggestedValue, definedValue);
      case DimensionScaleMode.maximum:
        return max(suggestedValue, definedValue);
      case DimensionScaleMode.both:
        return suggestedValue;
      case DimensionScaleMode.none:
        return definedValue;
    }
  }

  double _x(double value, double total) => max(0.0, value * total);

  double diagonal(
    Size screenSize,
    double value, [
    DimensionScaleMode? mode,
  ]) {
    final x = min(screenSize.width, screenSize.height);
    final y = min(assumedSize.width, assumedSize.height);
    final suggested = _x(value, x / y);
    return _s(value, suggested, mode);
  }

  double getWidth(
    double screenWidth,
    double value, [
    DimensionScaleMode? mode,
  ]) {
    final suggested = _x(value, screenWidth / assumedSize.width);
    return _s(value, suggested, mode);
  }

  double getHeight(
    double height,
    double value, [
    DimensionScaleMode? mode,
  ]) {
    final suggested = _x(value, height / assumedSize.height);
    return _s(value, suggested, mode);
  }
}
