import 'package:flutter/material.dart';
import 'package:screens/screens/practice.dart';

class Calculator extends StatelessWidget {
  Calculator({super.key});

  final List<String> buttons = [
    'C',
    '/',
    'x',
    '⌫',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '.',
    '%',
    '0',
    '=',
  ];
  final List<Color> colors = [
  Colors.grey.shade400, // C
  Colors.grey.shade400, // +/-
  Colors.grey.shade400, // %
  Colors.orange,        // /

  Colors.grey.shade800, // 7
  Colors.grey.shade800, // 8
  Colors.grey.shade800, // 9
  Colors.orange,        // ×

  Colors.grey.shade800, // 4
  Colors.grey.shade800, // 5
  Colors.grey.shade800, // 6
  Colors.orange,        // -

  Colors.grey.shade800, // 1
  Colors.grey.shade800, // 2
  Colors.grey.shade800, // 3
  Colors.orange,        // +

  Colors.grey.shade800, // 0
  Colors.grey.shade800, // .
  Colors.orange,        // =
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 10),

            child: Text(
              '450 + 50 + 200 + 500 ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '5500',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 85,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors[index],
                    ),
                    child: Text(buttons[index],style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
