import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Third Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Button to go back to the Second Screen
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back to Second Screen'),
            ),
            const SizedBox(height: 20),
            // Button to go back to the First Screen
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Go Back to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}