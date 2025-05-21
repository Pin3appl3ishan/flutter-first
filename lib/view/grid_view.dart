import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView'),),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
         children: List.generate(10, (index) {
          return Container(
            alignment: Alignment.center,
            color: index % 2 == 0 ? Colors.yellow : Colors.lightBlue,
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 50, color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}
