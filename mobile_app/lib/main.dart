import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const SmartResumeAnalyzerApp());
}

class SmartResumeAnalyzerApp extends StatelessWidget {
  const SmartResumeAnalyzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Resume Analyzer AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
