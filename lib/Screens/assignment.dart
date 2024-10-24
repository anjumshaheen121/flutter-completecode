import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar:  AppBar(
          title: const Text('Assignment'),
        ),
        body:const  Padding(
          padding: EdgeInsets.all(16.0),
          child: Assignment(
            label: 'Name',
            value: 'John Doe',
          ),
        ),
      ),
    );
  }
}

class Assignment extends StatelessWidget {
  final String label;
  final String value;

  const Assignment({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 2),
        TextField(
          enabled: false, // Disable editing
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: value,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
