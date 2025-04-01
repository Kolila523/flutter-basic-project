abstract class ListTickToeEvent {}

class OnClickBox extends ListTickToeEvent {
  OnClickBox({required this.colum, required this.row});
  final int colum;
  final int row;
}

class OnResetGame extends ListTickToeEvent {}
