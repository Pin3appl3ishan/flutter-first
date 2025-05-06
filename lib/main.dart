import 'package:flutter/material.dart';
import 'view/dashboard_screen.dart';
import 'package:first_ass/view/add_num.dart';
import 'view/area_circle.dart';
import 'view/simple_interest_screen.dart';
import 'view/palindrome_screen.dart';

void main() {
  runApp(const FirstAssignmentApp());
}

class FirstAssignmentApp extends StatelessWidget {
  const FirstAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Assignment',
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/add': (context) => const AddTwoNumbersScreen(),
        '/circle': (context) => const AreaOfCircleScreen(),
        '/interest': (context) => const SimpleInterestScreen(),
        '/palindrome': (context) => const PalindromeScreen(),
      },
    );
  }
}


