import 'package:flutter/material.dart';

import '../config.dart';

class ResponsiveLayout extends StatelessWidget {
  final DeviceType? keep;
  final Widget Function(BuildContext context, Device device) builder;

  const ResponsiveLayout({
    super.key,
    this.keep,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      keep != null ? context.deviceFromType(keep!) : context.device,
    );
  }
}
