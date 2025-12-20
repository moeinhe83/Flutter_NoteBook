import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

const moeinstyleAppBar = TextStyle(
  fontSize: 30,
  color: Colors.cyan,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("NoteBook", style: moeinstyleAppBar),
        ),
      ),
    );
  }
}
