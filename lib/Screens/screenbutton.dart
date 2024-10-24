// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

class Screenbutton extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Screenbutton> {
  // Variable to store the scaffold background color
  Color _scaffoldColor = Colors.white;

  // Function to change the scaffold color to a random color
  void _changeScaffoldColor() {
    setState(() {
      _scaffoldColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _scaffoldColor, // Set scaffold background color
        appBar: AppBar(
          title: Text('Change Scaffold Color'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Create 10 buttons
              for (int i = 1; i <= 10; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed:
                        _changeScaffoldColor, // Change color when button is pressed
                    child: Text('Button $i'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
