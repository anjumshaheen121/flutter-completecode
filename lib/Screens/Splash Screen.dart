import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to home screen after a delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    
    return const Scaffold(
      body: Center(child: Text("Health Check-In Companion", style: TextStyle(fontSize: 24))),
    );
  }
}
