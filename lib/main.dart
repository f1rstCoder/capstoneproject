import 'package:flutter/material.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/language_screen.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/registration_screen.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email and Password Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/register': (context) => const RegistrationScreen(),
        '/': (context) => const LoginScreen(),
        '/language': (context) => LanguageScreen(),
        '/home': (context) => HomeScreen(),
      },
      //  LoginScreen(),
    );
  }
}
