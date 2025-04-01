import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/calculator/bloc/calculator_result_bloc.dart';
import 'package:project_starter_pack/pages/calculator/bloc/calculator_result_event.dart';
import 'package:project_starter_pack/pages/calculator/widgets/numpad_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = context.read<CalculatorResultBloc>();

    updateResult(String input) {
      setState(() {
        calculatorBloc.add(
          UpdateResult(
            result: context.read<CalculatorResultBloc>().state.result + input,
          ),
        );
      });
    }

    clearResult() {
      setState(() {
        calculatorBloc.add(UpdateResult(result: ""));
      });
    }

    calculateResult() {
      var rawData = calculatorBloc.state.result.split(" ");
      List<String> formatedDataList = [];
      for (var subData in rawData) {
        formatedDataList.add(subData.replaceAll(" ", ""));
      }
      var currentOperation = "";
      int? valueA;
      int? valueB;
      for (var formatedData in formatedDataList) {
        if (formatedData == "+" ||
            formatedData == "-" ||
            formatedData == "*" ||
            formatedData == "/") {
          currentOperation = formatedData;
        } else if (valueA == null) {
          valueA = int.tryParse(formatedData);
        } else {
          valueB = int.tryParse(formatedData);
        }

        if (valueA != null && valueB != null && currentOperation.isNotEmpty) {
          switch (currentOperation) {
            case "+":
              valueA = valueA + valueB;
              break;
            case "-":
              valueA = valueA - valueB;
              break;
            case "*":
              valueA = valueA * valueB;
              break;
          }
        }
      }
      setState(() {
        calculatorBloc.state.result = valueA.toString();
      });
    }

    return Center(
      child: Column(
        children: [
          Text("Calculator"),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.amber),
              borderRadius: BorderRadius.circular(5),
            ),
            width: 250,
            child: Text(calculatorBloc.state.result),
          ),
          SizedBox(height: 50),
          NumpadCalculator(
            onClearInput: clearResult,
            onClickInput: updateResult,
            onSubmitResult: calculateResult,
          ),
        ],
      ),
    );
  }
}
