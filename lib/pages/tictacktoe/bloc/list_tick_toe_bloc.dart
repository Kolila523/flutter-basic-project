import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_event.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_state.dart';

class ListTickToeBloc extends Bloc<ListTickToeEvent, ListTickToeState> {
  ListTickToeBloc()
    : super(
        ListTickToeState(
          [
            ['', '', ''],
            ['', '', ''],
            ['', '', ''],
          ],
          "",
          false,
          "X",
          false,
        ),
      ) {
    on<OnClickBox>((event, emit) {
      if (state.listTickToe[event.colum][event.row].isNotEmpty) {
        return;
      }

      state.listTickToe[event.colum][event.row] = state.currentTurn;

      // Check Winner ///////////////////////////////////////////////////////
      for (var i = 0; i < 3; i++) {
        if (state.listTickToe[i][1].isNotEmpty &&
            state.listTickToe[i][0] == state.listTickToe[i][1] &&
            state.listTickToe[i][1] == state.listTickToe[i][2]) {
          state.winner = state.currentTurn;
        } else if (state.listTickToe[0][i].isNotEmpty &&
            state.listTickToe[0][i] == state.listTickToe[1][i] &&
            state.listTickToe[1][i] == state.listTickToe[2][i]) {
          state.winner = state.currentTurn;
        } else if (state.listTickToe[0][0].isNotEmpty &&
            state.listTickToe[0][0] == state.listTickToe[1][1] &&
            state.listTickToe[1][1] == state.listTickToe[2][2]) {
          state.winner = state.currentTurn;
        } else if (state.listTickToe[0][2].isNotEmpty &&
            state.listTickToe[0][2] == state.listTickToe[1][1] &&
            state.listTickToe[1][1] == state.listTickToe[2][0]) {
          state.winner = state.currentTurn;
        }
      }

      if (state.winner.isEmpty) {
        var isEnded = true;
        for (var i = 0; i < 3; i++) {
          for (var j = 0; j < 3; j++) {
            if (state.listTickToe[i][j].isEmpty) {
              isEnded = false;
              break;
            }
          }
        }

        if (isEnded) {
          state.isDraw = true;
        }
      }
      ///////////////////////////////////////////////////

      switch (state.currentTurn) {
        case "X":
          state.currentTurn = "O";
          break;
        case "O":
          state.currentTurn = "X";
      }

      emit(
        ListTickToeState(
          state.listTickToe,
          state.winner,
          state.isDraw,
          state.currentTurn,
          state.winner.isNotEmpty,
        ),
      );
    });

    on<OnResetGame>((event, emit) {
      emit(
        ListTickToeState(
          [
            ['', '', ''],
            ['', '', ''],
            ['', '', ''],
          ],
          "",
          false,
          "X",
          false,
        ),
      );
    });
  }
}
