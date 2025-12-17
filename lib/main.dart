import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/pages/home_page.dart';

// -----------------------------------------------------------------------------
// THEME SERVICE (Merged into main.dart)
// -----------------------------------------------------------------------------
class ThemeService extends ChangeNotifier {
  bool _isDark = true; // DEFAULT THEME → DARK

  bool get isDark => _isDark;

  void toggleTheme(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

// -----------------------------------------------------------------------------
// MAIN APPLICATION
// -----------------------------------------------------------------------------
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeService>().isDark;

    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,

      // Default is DARK theme
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),

      home: const HomePage(),
    );
  }
}
