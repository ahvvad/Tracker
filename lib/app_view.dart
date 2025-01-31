import 'package:flutter/material.dart';
import 'package:money_tracker/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            surface: Color(0xFFF3F5F7),
            onSurface: Colors.black,
            primary: Color(0xFF00B2E7),
            secondary: Color(0xFFE064F7),
            tertiary: Color(0xFFFF8D6C),
            outline: Colors.grey),
      ),
      home: const HomeScreen(),
    );
  }
}
