import 'package:flutter/material.dart';
import 'package:flutter_spectrum/constructors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Constructors(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff005c9a),
          brightness: Brightness.dark,
          surface: const Color(0xFF17202C),
          background: const Color(0xFF0E1215),
        ),
        useMaterial3: true,
      ),
    );
  }
}
