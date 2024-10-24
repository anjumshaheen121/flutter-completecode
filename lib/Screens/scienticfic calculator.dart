// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for mathematical functions

class ScientificCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0"; // For displaying current output
  double _num1 = 0; // Store first number
  double _num2 = 0; // Store second number
  String _operator = ""; // Store operator

  // Function to handle button presses
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0"; // Reset output
        _num1 = 0; // Reset first number
        _num2 = 0; // Reset second number
        _operator = ""; // Reset operator
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.parse(_output); // Parse the first number
        _operator = buttonText; // Store operator
        _output = "0"; // Reset output for next input
      } else if (buttonText == "=") {
        _num2 = double.parse(_output); // Parse the second number

        // Perform the operation
        switch (_operator) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "*":
            _output = (_num1 * _num2).toString();
            break;
          case "/":
            _output = (_num1 / _num2).toString();
            break;
        }
        _operator = ""; // Reset operator
      } else if (buttonText == "√") {
        _output = sqrt(double.parse(_output)).toString(); // Square root function
      } else if (buttonText == "sin") {
        _output = sin(double.parse(_output) * pi / 180).toString(); // Sin function (in degrees)
      } else if (buttonText == "cos") {
        _output = cos(double.parse(_output) * pi / 180).toString(); // Cos function (in degrees)
      } else {
        if (_output == "0") {
          _output = buttonText; // Replace '0' with pressed number
        } else {
          _output = _output + buttonText; // Concatenate digits for multi-digit numbers
        }
      }
    });
  }

  // Function to build buttons
  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/"),
            ]),
            Row(children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*"),
            ]),
            Row(children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ]),
            Row(children: [
              _buildButton("C"),
              _buildButton("0"),
              _buildButton("="),
              _buildButton("+"),
            ]),
            Row(children: [
              _buildButton("√"),
              _buildButton("sin"),
              _buildButton("cos"),
            ]),
          ])
        ],
      ),
    );
  }
}
