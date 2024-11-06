import 'package:clario_test_task/screens/signup_screen.dart';
import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: const SignupScreen(),
    );
  }
}
