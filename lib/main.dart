import 'package:flutter/material.dart';
import 'package:tabbar/home.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
