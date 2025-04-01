import 'package:flutter/material.dart';

class ButtonCalculator extends StatefulWidget {
  const ButtonCalculator({super.key, required this.inputNumber});

  final String inputNumber;

  @override
  State<ButtonCalculator> createState() => _ButtonCalculatorState();
}

class _ButtonCalculatorState extends State<ButtonCalculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.amber, width: 1),
      ),
      child: Center(
        child: Text(
          widget.inputNumber.toString(),
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
