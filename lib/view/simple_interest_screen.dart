import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  double? _interest;

  void _calculateInterest() {
    final double? p = double.tryParse(_principalController.text);
    final double? r = double.tryParse(_rateController.text);
    final double? t = double.tryParse(_timeController.text);

    if (p != null && r != null && t != null) {
      setState(() {
        _interest = (p * r * t) / 100;
      });
    } else {
      setState(() {
        _interest = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Principal (P)',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate (%) (R)',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Time (T in years)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: const Text('Calculate Interest'),
            ),
            const SizedBox(height: 20),
            if (_interest != null)
              Text(
                'Simple Interest: ${_interest!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
