class ListTickToeState {
  List<List<String>> listTickToe;
  String winner;
  bool isDraw;
  String currentTurn;
  bool isWon;

  ListTickToeState(
    this.listTickToe,
    this.winner,
    this.isDraw,
    this.currentTurn,
    this.isWon,
  );
}
