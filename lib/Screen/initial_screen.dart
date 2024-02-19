import 'package:flutter/material.dart';
import 'package:scube_project_tracker/Screen/splash_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
