import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/calculator/bloc/calculator_result_event.dart';
import 'package:project_starter_pack/pages/calculator/bloc/calculator_result_state.dart';

class CalculatorResultBloc
    extends Bloc<CalculatorResultEvent, CalculatorResultState> {
  CalculatorResultBloc() : super(CalculatorResultState("")) {
    on<UpdateResult>((event, emit) {
      emit(CalculatorResultState(event.result));
    });
  }
}
