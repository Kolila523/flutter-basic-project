import 'package:flutter/material.dart';
import 'package:project_starter_pack/pages/calculator/widgets/button_calculator.dart';

class NumpadCalculator extends StatefulWidget {
  const NumpadCalculator({
    super.key,
    required this.onClickInput,
    required this.onClearInput,
    required this.onSubmitResult,
  });

  final Function(String input) onClickInput;
  final Function() onClearInput;
  final Function() onSubmitResult;

  @override
  State<NumpadCalculator> createState() => _NumpadCalculatorState();
}

class _NumpadCalculatorState extends State<NumpadCalculator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.onClickInput("1");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "1"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("2");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "2"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("3");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "3"),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.onClickInput("4");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "4"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("5");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "5"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("6");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "6"),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.onClickInput("7");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "7"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("8");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "8"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput("9");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "9"),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.onClickInput("0");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "0"),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.onClickInput(" + ");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "+"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput(" - ");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "-"),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                widget.onClickInput(" * ");
              },
              child: Ink(
                width: 75,
                height: 75,
                child: ButtonCalculator(inputNumber: "*"),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: widget.onSubmitResult,
              child: Text("Submit"),
            ),
            FilledButton(onPressed: widget.onClearInput, child: Text("Clear")),
          ],
        ),
      ],
    );
  }
}
