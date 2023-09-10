import 'package:flutter/material.dart';
import 'package:movie_app/config/theme.dart';
import 'package:movie_app/features/auth/ui/login_page.dart';
import 'package:movie_app/features/auth/ui/sign_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SignPage(),
    );
  }
}
