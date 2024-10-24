import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the Third Screen (Unnamed Route)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: const Text('Go to Third Screen (Unnamed Route)'),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the Third Screen (Named Route)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Go to second screen (Named Route)'),
            ),
            const SizedBox(height: 20),
            // Button to go back to the First Screen
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
