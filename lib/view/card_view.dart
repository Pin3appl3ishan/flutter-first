import 'package:first_ass/common/my_card.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 1; i <= 10; i++) ...{
              if (i % 2 == 0) ...{
                MyCard(title: 'Card $i', color: Colors.blue),
              } else ...{
                MyCard(title: 'Card $i', color: Colors.yellow),
              },
            },
          ],
        ),
      ),
    );
  }
}
