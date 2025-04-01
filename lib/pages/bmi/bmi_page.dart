import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/bmi/bloc/bmi_bloc.dart';
import 'package:project_starter_pack/pages/bmi/bloc/bmi_event.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double weight = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    final bmiBloc = context.watch<BmiBloc>();

    return Center(
      child: Column(
        children: [
          Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Text("Your BMI : ${bmiBloc.state.bmi.toStringAsFixed(2)}"),
          SizedBox(height: 10),
          Text(
            bmiBloc.state.status.isNotEmpty
                ? "Your Status: ${bmiBloc.state.status}"
                : "",
          ),
          SizedBox(height: 50),
          Text("Input Your weight (Kg)"),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Text("Input Your Height (m)"),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
            ),
          ),
          SizedBox(height: 50),
          FilledButton(
            onPressed: () {
              context.read<BmiBloc>().add(
                CalculateBMI(weight: weight, height: height),
              );
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
