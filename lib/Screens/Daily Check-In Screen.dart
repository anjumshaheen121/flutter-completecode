import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String mood = 'Happy';
  int energyLevel = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Check-In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('How are you feeling today?'),
            DropdownButton<String>(
              value: mood,
              items: ['Happy', 'Sad', 'Tired', 'Energetic'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  mood = newValue!;
                });
              },
            ),
            const Text('Energy Level'),
            Slider(
              value: energyLevel.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: energyLevel.toString(),
              onChanged: (double newValue) {
                setState(() {
                  energyLevel = newValue.round();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Save check-in data and navigate back to home
                Navigator.pop(context);
              },
              child: const Text('Submit Check-In'),
            ),
          ],
        ),
      ),
    );
  }
}
