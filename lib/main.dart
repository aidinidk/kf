import 'package:flutter/material.dart';
import 'package:kf/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictorany',
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 58, 138, 27),
              brightness: Brightness.dark,
              surface: const Color.fromARGB(255, 65, 51, 62)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 134, 70, 194)),
      home: const HomeScreen(),
    );
  }
}
