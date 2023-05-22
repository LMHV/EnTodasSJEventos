import 'package:flutter/material.dart';
import 'package:practicando_flutter/screens/category_screen.dart';
import 'package:practicando_flutter/screens/home_screen.dart';
import 'package:practicando_flutter/screens/intro_screen.dart';
import 'package:practicando_flutter/screens/login_screen/login_screen.dart';
import 'package:practicando_flutter/screens/signup_screen/signup_screen.dart';
import 'package:practicando_flutter/screens/test_screen/test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute = '/';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  initialRoute = (token?.isNotEmpty ?? false) ? '/home' : '/';
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        "/": (context) => const IntroScreen(),
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        "/category": (context) => const CategoryScreen(),
        "/test": (context) => const TestScreen()
      },
    );
  }
}
