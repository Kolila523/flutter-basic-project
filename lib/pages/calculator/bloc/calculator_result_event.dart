abstract class CalculatorResultEvent {}

class UpdateResult extends CalculatorResultEvent {
  UpdateResult({required this.result});
  final String result;
}
