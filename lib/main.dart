import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/theme.dart';

import 'features/auth/presentation/pages/signup_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: AppTheme.getThemeData(),
      home: const AuthScreen(),
    );
  }
}
