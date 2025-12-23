import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/themes_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesManager.getTheme(SpectraThemeMode.dark),
      home: const Placeholder(),
    );
  }
}
