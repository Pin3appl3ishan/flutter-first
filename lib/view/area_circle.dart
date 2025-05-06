import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircleScreen extends StatefulWidget {
  const AreaOfCircleScreen({super.key});

  @override
  State<AreaOfCircleScreen> createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  final TextEditingController _radiusController = TextEditingController();
  double? _area;

  void _calculateArea() {
    final double? radius = double.tryParse(_radiusController.text);
    if (radius != null) {
      setState(() {
        _area = pi * radius * radius;
      });
    } else {
      setState(() {
        _area = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Area of Circle')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter radius',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 20),
            if (_area != null)
              Text(
                'Area: ${_area!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
