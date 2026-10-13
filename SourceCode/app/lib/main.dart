import 'package:flutter/material.dart';

import 'screens/bai1.dart';
import 'screens/bai2.dart';
import 'screens/bai3.dart';
import 'screens/bai4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CalculatorScreen(),

      // home: StudentListScreen(),
      // home: GradingScreen(),
      home: ClassBoardScreen(),
    );
  }
}