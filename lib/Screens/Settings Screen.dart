import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Update notification preferences
              },
              child: const Text('Set Notification Preferences'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update profile details
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
