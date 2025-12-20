import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ==================== /* moeinstyle For Text */ ====================
const moeinstyleAppBar = TextStyle(
  fontSize: 30,
  color: Colors.cyan,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);

// ==================== /* MyApp StatefulWidget */ ====================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text("NoteBook", style: moeinstyleAppBar),
          actions: [
            Switch(
              value: _themeMode == ThemeMode.dark,
              onChanged: changeTheme,
            ),
          ],
        ),
      ),
    );
  }
}
