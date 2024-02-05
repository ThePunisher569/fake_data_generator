import 'package:fake_data_generator/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      routerConfig: myRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
