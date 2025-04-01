import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/bmi/bloc/bmi_event.dart';
import 'package:project_starter_pack/pages/bmi/bloc/bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiState(0, "")) {
    on<CalculateBMI>((event, emit) {
      double bmi;
      String status = "";
      bmi =
          event.weight / double.parse(pow(event.height, 2).toStringAsFixed(2));
      switch (bmi) {
        case <= 18.4:
          status = "Underweight";
          break;
        case >= 18.5 && <= 24.9:
          status = "Normal";
          break;
        case >= 25 && <= 39.9:
          status = "Overweight";
          break;
        case >= 40:
          status = "Obese";
      }

      emit(BmiState(bmi, status));
    });
  }
}
