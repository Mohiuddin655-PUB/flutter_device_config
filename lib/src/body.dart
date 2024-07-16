import 'package:flutter/material.dart';

import 'config.dart';
import 'dimen.dart';

class ResponsiveBody extends StatelessWidget {
  final bool innerDimenMode;
  final Size? assumedSize;
  final Size? screenSize;
  final Widget Function(BuildContext context, DimensionSize dimen) builder;

  const ResponsiveBody({
    super.key,
    this.innerDimenMode = false,
    this.assumedSize,
    this.screenSize,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if (screenSize != null || !innerDimenMode) {
      final body = screenSize ?? MediaQuery.sizeOf(context);
      final dimen = DimensionSize(
        body.width,
        body.height,
        assumedSize ?? DeviceConfig.assumedSize(body),
      );
      return builder(context, dimen);
    }
    return LayoutBuilder(
      builder: (context, body) {
        final dimen = DimensionSize(
          body.maxWidth,
          body.maxHeight,
          assumedSize ??
              DeviceConfig.i.device(body.maxWidth, body.maxHeight).assumedSize,
        );
        return builder(context, dimen);
      },
    );
  }
}
