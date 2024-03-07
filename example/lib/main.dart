import 'package:flutter/material.dart';
import 'package:uni_selected_button/uni_selected_button.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(title: const Text('UniSelectedButton Demo')),
        body: Center(
          child: UniButtonGroup(
            children: [
              SelectedButton<ThemeMode>(
                label: const Text('Light', style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.light_mode, color: Colors.white),
                value: ThemeMode.light,
                groupValue: _themeMode,
                syncBoxShadowsWithBorder: true,
                onPressed: (value) => _updateTheme(value),
              ),
              SelectedButton<ThemeMode>(
                label: const Text('Dark', style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.dark_mode, color: Colors.white),
                value: ThemeMode.dark,
                groupValue: _themeMode,
                syncBoxShadowsWithBorder: true,
                onPressed: (value) => _updateTheme(value),
              ),
              SelectedButton<ThemeMode>(
                label: const Text('System', style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.laptop, color: Colors.white),
                value: ThemeMode.system,
                groupValue: _themeMode,
                syncBoxShadowsWithBorder: true,
                onPressed: (value) => _updateTheme(value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateTheme(ThemeMode newMode) {
    setState(() {
      _themeMode = newMode;
    });
  }
}
