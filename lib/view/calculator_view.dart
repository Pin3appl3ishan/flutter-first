import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      'C',
      '*',
      '/',
      '<-',
      '1',
      '2',
      '3',
      '+',
      '4',
      '5',
      '6',
      '-',
      '7',
      '8',
      '9',
      '*',
      '%',
      '0',
      '.',
      '=',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 4 / 5,
              crossAxisCount: 4,
              padding: EdgeInsets.all(12),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                for (int i = 0; i < buttons.length; i++)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // button press logic
                    },
                    child: Text(
                      buttons[i],
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
