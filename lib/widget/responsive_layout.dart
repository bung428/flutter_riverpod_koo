import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/enum/device_type.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext context, DeviceType deviceData);

class ResponsiveLayout extends StatelessWidget {
  final ResponsiveBuilder builder;

  const ResponsiveLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = Size(constraints.maxWidth, constraints.maxHeight);
      late DeviceType deviceData;
      if (size.width < 600) {
        deviceData = DeviceType.device;
      } else if (size.width < 840) {
        deviceData = DeviceType.tablet;
      } else {
        deviceData = DeviceType.web;
      }
      return builder(context, deviceData);
    });
  }
}