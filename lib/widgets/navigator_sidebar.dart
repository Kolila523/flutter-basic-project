import 'package:flutter/material.dart';

class NavigatorSizeBar extends StatefulWidget {
  const NavigatorSizeBar({
    super.key,
    required this.onSelectDestination,
    required this.currentPage,
  });

  final Function(int) onSelectDestination;
  final int currentPage;

  @override
  State<NavigatorSizeBar> createState() => _NavigatorSizeBarState();
}

class _NavigatorSizeBarState extends State<NavigatorSizeBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: true,
      onDestinationSelected: (value) {
        widget.onSelectDestination(value);
      },
      destinations: [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
        NavigationRailDestination(
          icon: Icon(Icons.calculate),
          label: Text("Calculator"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.gamepad),
          label: Text("Tic Tack Toe"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.monitor_weight),
          label: Text("BMI"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.calendar_today_sharp),
          label: Text("ToDos"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.change_circle),
          label: Text("Convert to number"),
        ),
      ],
      selectedIndex: widget.currentPage,
    );
  }
}
