import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/category_screen.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/screens/login_screen/login_screen.dart';
import 'package:practicando_flutter/screens/signup_screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/category": (context) => CategoryScreen()
      },
    );
  }
}
