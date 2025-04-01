import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/bloc/counter/counter_bloc.dart';
import 'package:project_starter_pack/bloc/counter/counter_event.dart';
import 'package:project_starter_pack/bloc/counter/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to my app"),
              SizedBox(height: 30),
              Text("Test Bloc : ${counterBloc.state.count}"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      counterBloc.add(CounterIncrementPressed());
                    },
                    child: Text("Increment"),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      counterBloc.add(CounterDecrementPressed());
                    },
                    child: Text("Decrement"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
