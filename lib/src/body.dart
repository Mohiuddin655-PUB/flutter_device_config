import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../config.dart';

class ResponsiveBody extends StatefulWidget {
  final DeviceType? keep;
  final Widget Function(BuildContext context, Device device) builder;

  const ResponsiveBody({
    super.key,
    this.keep,
    required this.builder,
  });

  @override
  State<ResponsiveBody> createState() => _ResponsiveBodyState();
}

class _ResponsiveBodyState extends State<ResponsiveBody> {
  Size _size = Size.zero;

  Device get _device {
    if (_size == Size.zero) return const Device.mobile(width: 0, height: 0);
    return widget.keep != null ? Device.from(widget.keep!) : context.device;
  }

  @override
  Widget build(BuildContext context) {
    return _RenderWidget(
      render: (size) => setState(() => _size = size),
      child: widget.builder(
        context,
        _device.copy(width: _size.width, height: _size.height),
      ),
    );
  }
}

class _RenderWidget extends SingleChildRenderObjectWidget {
  final Function(Size size) render;

  const _RenderWidget({
    required this.render,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBox(render);
  }
}

class _RenderBox extends RenderProxyBox {
  final void Function(Size size) render;

  Size? ox;

  _RenderBox(this.render);

  @override
  void performLayout() {
    super.performLayout();
    try {
      Size? nx = child?.size;
      if (nx != null && ox != nx) {
        ox = nx;
        WidgetsBinding.instance.addPostFrameCallback((_) => render(nx));
      }
    } catch (_) {}
  }
}
