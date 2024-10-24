import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to my Profile',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: const Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/Pictures/ali.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
