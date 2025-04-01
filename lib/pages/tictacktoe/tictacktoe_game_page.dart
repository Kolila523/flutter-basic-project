import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_bloc.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_event.dart';
import 'package:project_starter_pack/pages/tictacktoe/widgets/tictacktoe_button.dart';

class TicTackToeGamePage extends StatefulWidget {
  const TicTackToeGamePage({super.key});

  @override
  State<TicTackToeGamePage> createState() => _TicTackToeGamePageState();
}

class _TicTackToeGamePageState extends State<TicTackToeGamePage> {
  List<List<String>> listTickToe = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];

  var currentTurn = "X";
  var winner = "";
  var isDraw = false;

  onResetGame() {
    setState(() {
      listTickToe = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
      ];
      currentTurn = "X";
      winner = "";
      isDraw = false;
    });
  }

  onClickBox(int colum, int row) {
    if (listTickToe[colum][row].isNotEmpty) {
      return;
    }
    setState(() {
      listTickToe[colum][row] = currentTurn;
    });

    checkWin();

    switch (currentTurn) {
      case "X":
        setState(() {
          currentTurn = "O";
        });

        break;
      case "O":
        setState(() {
          currentTurn = "X";
        });
    }
  }

  checkWin() {
    for (var i = 0; i < 3; i++) {
      if (listTickToe[i][1].isNotEmpty &&
          listTickToe[i][0] == listTickToe[i][1] &&
          listTickToe[i][1] == listTickToe[i][2]) {
        setState(() {
          winner = currentTurn;
        });
      } else if (listTickToe[0][i].isNotEmpty &&
          listTickToe[0][i] == listTickToe[1][i] &&
          listTickToe[1][i] == listTickToe[2][i]) {
        setState(() {
          winner = currentTurn;
        });
      } else if (listTickToe[0][0].isNotEmpty &&
          listTickToe[0][0] == listTickToe[1][1] &&
          listTickToe[1][1] == listTickToe[2][2]) {
        setState(() {
          winner = currentTurn;
        });
      } else if (listTickToe[0][2].isNotEmpty &&
          listTickToe[0][2] == listTickToe[1][1] &&
          listTickToe[1][1] == listTickToe[2][0]) {
        setState(() {
          winner = currentTurn;
        });
      }
    }

    if (winner.isEmpty) {
      var isEnded = true;
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (listTickToe[i][j].isEmpty) {
            isEnded = false;
            break;
          }
        }
      }

      if (isEnded) {
        setState(() {
          isDraw = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ticTacToeBloc = context.watch<ListTickToeBloc>();
    final ticTacToeBlocStatic = context.read<ListTickToeBloc>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ticTacToeBloc.state.isDraw
                ? "Draw"
                : ticTacToeBloc.state.winner.isNotEmpty
                ? "Winner is ${ticTacToeBloc.state.winner}"
                : "Current turn: ${ticTacToeBloc.state.currentTurn}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TicTackToeButton(position: [0, 0]),
              SizedBox(width: 20),
              TicTackToeButton(position: [0, 1]),
              SizedBox(width: 20),
              TicTackToeButton(position: [0, 2]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TicTackToeButton(position: [1, 0]),
              SizedBox(width: 20),
              TicTackToeButton(position: [1, 1]),
              SizedBox(width: 20),
              TicTackToeButton(position: [1, 2]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TicTackToeButton(position: [2, 0]),
              SizedBox(width: 20),
              TicTackToeButton(position: [2, 1]),
              SizedBox(width: 20),
              TicTackToeButton(position: [2, 2]),
            ],
          ),
          SizedBox(height: 30),
          FilledButton(
            onPressed: () {
              setState(() {
                ticTacToeBlocStatic.add(OnResetGame());
              });
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
