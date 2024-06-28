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
