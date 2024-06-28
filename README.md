# flutter_device_config

flutter_device_config is a Flutter package that helps you tailor your UI to different screen sizes
and pixel densities. It provides utilities to:

1. Detect device type: Determine if the device is a watch, mobile, tablet, laptop, desktop, or TV.
   Calculate responsive font sizes: Adjust font sizes based on screen dimensions for optimal
   readability.

2. Determine pixel density: Get the device's pixel density to load appropriate image assets.

3. Build responsive layouts: Create layouts that adapt to different screen sizes and orientations.
   By using flutter_device_config, you can ensure your Flutter app looks great and functions well
   on a wide range of devices.

## 1. Detect device type:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_device_config/config.dart';

void main() {
  DeviceConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Device Config',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "${context.device}",
          style: TextStyle(
            fontSize: context.sp(14),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

## 2. Determine pixel density:

```dart
Device device = context.device; // Type, width, height, scaleFactor
DeviceType deviceType = context.deviceType; // WATCH, MOBILE, TABLET, LAPTOP, DESKTOP, TV
double fontSize = context.sp(24); // 24 * font scale factor depending on screen size
double containerWidth = context.dp(200); // 200 * size scale factor depending on screen size
```

## 3. Build responsive layouts:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_device_config/config.dart';

void main() {
  DeviceConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Device Config',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // keep: DeviceType.laptop, // OPTIONAL
      builder: (context, device) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text(
              "$device",
              style: TextStyle(
                fontSize: device.sp(24),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
```