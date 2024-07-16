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
         body: Center(
            child: Container(
               alignment: Alignment.center,
               width: context.dx(350),
               height: context.dy(350),
               decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(context.dp(25)),
               ),
               child: Text(
                  "${context.dp(16).toStringAsFixed(2)}\n${context.device}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                     fontSize: context.dp(16),
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                  ),
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
double fontSize = context.dp(24); // 24 * font assumed size factor depending on screen size
double containerWidth = context.dx(200); // 200 * assumed size scale factor depending on screen width
double containerHeight = context.dy(200); // 200 * assumed size scale factor depending on screen height
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