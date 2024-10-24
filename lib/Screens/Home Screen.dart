import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Check-In Companion')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/checkin'),
              child: const Text('Daily Check-In'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('View History'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/recommendations'),
              child: const Text('Health Recommendations'),
            ),
          ],
        ),
      ),
    );
  }
}
