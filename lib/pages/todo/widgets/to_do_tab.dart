import 'package:flutter/material.dart';
import 'package:project_starter_pack/models/to_do_model.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({super.key, required this.headerData});

  final ToDoModel headerData;
  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: widget.headerData.colors),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: widget.headerData.colors),
              ),
            ),
            child: Center(child: Text(widget.headerData.title)),
          ),
          Expanded(child: Column(children: [Text("data")])),
        ],
      ),
    );
  }
}
