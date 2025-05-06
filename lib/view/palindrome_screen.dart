import 'package:flutter/material.dart';

class PalindromeScreen extends StatefulWidget {
  const PalindromeScreen({super.key});

  @override
  State<PalindromeScreen> createState() => _PalindromeScreenState();
}

class _PalindromeScreenState extends State<PalindromeScreen> {
  final TextEditingController _numberController = TextEditingController();
  String? _result;

  void _checkPalindrome() {
    final String input = _numberController.text;
    if (input.isEmpty || int.tryParse(input) == null) {
      setState(() {
        _result = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    String reversed = input.split('').reversed.join('');
    if (input == reversed) {
      setState(() {
        _result = '$input is a palindrome';
      });
    } else {
      setState(() {
        _result = '$input is not a palindrome';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Palindrome Number')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPalindrome,
              child: const Text('Check'),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                _result!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
