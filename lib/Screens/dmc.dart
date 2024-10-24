import 'package:flutter/material.dart';

class DMC extends StatefulWidget {
  const DMC({super.key});

  @override
  _DMCState createState() => _DMCState();
}

class _DMCState extends State<DMC> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for subjects
  final TextEditingController _mathController = TextEditingController();
  final TextEditingController _physicsController = TextEditingController();
  final TextEditingController _chemistryController = TextEditingController();
  final TextEditingController _englishController = TextEditingController();
  final TextEditingController _computerController = TextEditingController();

  int totalMarks = 500;
  double percentage = 0.0;
  String grade = '';
  int obtainedMarks = 0;

  // Function to calculate the grade
  String calculateGrade(double percentage) {
    if (percentage >= 90) {
      return "A+";
    } else if (percentage >= 80) {
      return "A";
    } else if (percentage >= 70) {
      return "B";
    } else if (percentage >= 60) {
      return "C";
    } else if (percentage >= 50) {
      return "D";
    } else {
      return "F";
    }
  }

  // Function to calculate the total marks, percentage, and grade
  void calculateResults() {
    setState(() {
      obtainedMarks = (int.tryParse(_mathController.text) ?? 0) +
          (int.tryParse(_physicsController.text) ?? 0) +
          (int.tryParse(_chemistryController.text) ?? 0) +
          (int.tryParse(_englishController.text) ?? 0) +
          (int.tryParse(_computerController.text) ?? 0);

      percentage = (obtainedMarks / totalMarks) * 100;
      grade = calculateGrade(percentage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DMC Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Enter Marks for Each Subject (Out of 100):',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              // Input fields for marks in subjects
              TextFormField(
                controller: _mathController,
                decoration: const InputDecoration(labelText: 'Math'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks for Math';
                  }
                  if (int.tryParse(value)! > 100) {
                    return 'Marks should not exceed 100';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _physicsController,
                decoration: const InputDecoration(labelText: 'Physics'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks for Physics';
                  }
                  if (int.tryParse(value)! > 100) {
                    return 'Marks should not exceed 100';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _chemistryController,
                decoration: const InputDecoration(labelText: 'Chemistry'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks for Chemistry';
                  }
                  if (int.tryParse(value)! > 100) {
                    return 'Marks should not exceed 100';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _englishController,
                decoration: const InputDecoration(labelText: 'English'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks for English';
                  }
                  if (int.tryParse(value)! > 100) {
                    return 'Marks should not exceed 100';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _computerController,
                decoration: const InputDecoration(labelText: 'Computer'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks for Computer';
                  }
                  if (int.tryParse(value)! > 100) {
                    return 'Marks should not exceed 100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateResults();
                  }
                },
                child: const Text('Calculate DMC'),
              ),
              const SizedBox(height: 16),
              // Display result after calculation
              if (obtainedMarks > 0) ...[
                Text(
                  'Total Marks Obtained: $obtainedMarks / $totalMarks',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Percentage: ${percentage.toStringAsFixed(2)}%',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Grade: $grade',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
