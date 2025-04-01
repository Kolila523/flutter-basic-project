abstract class BmiEvent {}

class CalculateBMI extends BmiEvent {
  CalculateBMI({required this.weight, required this.height});
  final double weight;
  final double height;
}
