import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import './utils/colors.dart';
import './screens/log_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hermes',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home-screen': (context) =>  home_screen(),
      },
      home: const LoginScreen(),
    );
  }
}
