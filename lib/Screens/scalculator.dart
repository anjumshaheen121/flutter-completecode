import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  var firstCon = TextEditingController();
  var secondCon = TextEditingController();

  double result = 0.0; // Use double to handle division results

  void _performOperation(String operation) {
    String first = firstCon.text.trim();
    String second = secondCon.text.trim();

    if (first.isNotEmpty && second.isNotEmpty) {
      double f = double.parse(first);
      double s = double.parse(second);

      switch (operation) {
        case 'Add':
          result = f + s;
          break;
        case 'Sub':
          result = f - s;
          break;
        case 'Mul':
          result = f * s;
          break;
        case 'Div':
          if (s != 0) {
            result = f / s;
          } else {
            result = double.infinity; // Handle division by zero
          }
          break;
      }

      setState(() {}); // Update the result on UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: firstCon,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Number One',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondCon,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Number Two',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _performOperation('Add'),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('Sub'),
                  child: const Text('Sub'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('Mul'),
                  child: const Text('Mul'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('Div'),
                  child: const Text('Div'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Result: $result',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
