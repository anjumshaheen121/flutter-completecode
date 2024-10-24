import 'package:flutter/material.dart';

// Create a model for Check-In data (you can replace this with actual data source later)
class CheckInData {
  final String mood;
  final int energyLevel;

  CheckInData({required this.mood, required this.energyLevel});
}

// Example list of check-in data
List<CheckInData> checkInData = [
  CheckInData(mood: 'Happy', energyLevel: 8),
  CheckInData(mood: 'Tired', energyLevel: 4),
  CheckInData(mood: 'Energetic', energyLevel: 9),
];

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: ListView.builder(
        itemCount: checkInData.length,  // Use the defined list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Mood: ${checkInData[index].mood}'),
            subtitle: Text('Energy Level: ${checkInData[index].energyLevel}'),
          );
        },
      ),
    );
  }
}
