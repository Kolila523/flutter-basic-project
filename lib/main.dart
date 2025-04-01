import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_starter_pack/pages/bmi/bloc/bmi_bloc.dart';
import 'package:project_starter_pack/pages/calculator/bloc/calculator_result_bloc.dart';
import 'package:project_starter_pack/bloc/counter/counter_bloc.dart';
import 'package:project_starter_pack/pages/bmi/bmi_page.dart';
import 'package:project_starter_pack/pages/calculator/calculator_page.dart';
import 'package:project_starter_pack/pages/change_to_number/change_to_number_page.dart';
import 'package:project_starter_pack/pages/home_page.dart';
import 'package:project_starter_pack/pages/tictacktoe/bloc/list_tick_toe_bloc.dart';
import 'package:project_starter_pack/pages/tictacktoe/tictacktoe_game_page.dart';
import 'package:project_starter_pack/pages/todo/to_do_page.dart';
import 'package:project_starter_pack/widgets/navigator_sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utility App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => CounterBloc()),
          BlocProvider(create: (ctx) => CalculatorResultBloc()),
          BlocProvider(create: (ctx) => ListTickToeBloc()),
          BlocProvider(create: (ctx) => BmiBloc()),
        ],
        child: const MyHomePage(title: "Utility App"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> listPage = [
    HomePage(),
    Calculator(),
    TicTackToeGamePage(),
    BmiPage(),
    Expanded(child: ToDoPage()),
    ChangeToNumberPage(),
  ];
  var currentPage = 0;
  var isShowSideBar = false;
  onSelectDestination(int page) {
    setState(() {
      currentPage = page;
      isShowSideBar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            setState(() {
              isShowSideBar = !isShowSideBar;
            });
          },
          icon: Icon(Icons.menu),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: currentPage,
      //   onDestinationSelected: (value) {
      //     onSelectDestination(value);
      //   },
      //   destinations: [
      //     NavigationDestination(icon: Icon(Icons.home), label: "Home"),
      //     NavigationDestination(
      //       icon: Icon(Icons.calculate),
      //       label: "Calculator",
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.gamepad),
      //       label: "Tic Tack Toe",
      //     ),
      //     NavigationDestination(icon: Icon(Icons.monitor_weight), label: "BMI"),
      //   ],
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isShowSideBar,
            child: SafeArea(
              child: NavigatorSizeBar(
                onSelectDestination: onSelectDestination,
                currentPage: currentPage,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [listPage[currentPage]],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
