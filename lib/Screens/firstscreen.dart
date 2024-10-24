import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/secondscreen.dart';
import 'package:my_first_project/Screens/thirdscreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the First Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the Second Screen (Unnamed Route)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: const Text('Go to Second Screen (Ali)'),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the Second Screen (Named Route)
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ThirdScreen()));
              },
              child: const Text('Go to third Screen (Named Route)'),
            ),
          ],
        ),
      ),
    );
  }
}