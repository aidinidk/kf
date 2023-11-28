import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/screens/home_screen.dart';
import 'package:kf/theme/theme_constants.dart';
import 'package:kf/theme/theme_manager.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  runApp(const ProviderScope(child: MyApp()));
  await Future.delayed(const Duration(milliseconds: 1));
  FlutterNativeSplash.remove();
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictorany',
      theme: lighTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: HomeScreen(
        themeManager: _themeManager,
        notifyParent: refresh,
      ),
    );
  }
}
