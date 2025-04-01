import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/calculator/widgets/button_calculator.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_bloc.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_event.dart';

class TicTackToeButton extends StatefulWidget {
  const TicTackToeButton({super.key, required this.position});
  final List<int> position;

  @override
  State<TicTackToeButton> createState() => _TicTackToeButtonState();
}

class _TicTackToeButtonState extends State<TicTackToeButton> {
  @override
  Widget build(BuildContext context) {
    final ticTackToeBloc = context.read<ListTickToeBloc>();

    updateBox() {
      setState(() {
        ticTackToeBloc.add(
          OnClickBox(colum: widget.position[0], row: widget.position[1]),
        );
      });
    }

    return InkWell(
      onTap: () {
        !ticTackToeBloc.state.isWon ? updateBox() : null;
      },
      child: Ink(
        width: 75,
        height: 75,
        child: ButtonCalculator(
          inputNumber:
              context.read<ListTickToeBloc>().state.listTickToe[widget
                  .position[0]][widget.position[1]],
        ),
      ),
    );
  }
}
