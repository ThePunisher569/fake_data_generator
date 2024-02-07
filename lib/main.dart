import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

//TODO add font

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fake Data Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        iconTheme: const IconThemeData(
          color: Colors.black87,
          size: 32,
          weight: 600.0,
        ),
        scaffoldBackgroundColor: Colors.black87,
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: MaterialStatePropertyAll(Colors.white30),
          thickness: MaterialStatePropertyAll(12),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(40),
          ),
          textAlign: TextAlign.center,
          height: 24,
          padding: const EdgeInsets.all(16),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      routerConfig: myRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
