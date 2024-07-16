import 'package:flutter/material.dart';
import 'package:flutter_device_config/config.dart';

void main() {
  DeviceConfig.init(
    scaleMode: DimensionScaleMode.minimum,
  );
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
