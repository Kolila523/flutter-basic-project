import 'package:flutter/material.dart';
import 'package:project_starter_pack/models/to_do_model.dart';
import 'package:project_starter_pack/pages/todo/widgets/to_do_tab.dart';

class ListTable extends StatefulWidget {
  const ListTable({super.key});

  @override
  State<ListTable> createState() => _ListTableState();
}

class _ListTableState extends State<ListTable> {
  final List<ToDoModel> toDoHeader = [
    ToDoModel(colors: Colors.red, title: "To Do"),
    ToDoModel(colors: Colors.yellow, title: "In Progress"),
    ToDoModel(colors: Colors.green, title: "Done"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToDoTab(headerData: toDoHeader[0]),
          SizedBox(width: 20),
          ToDoTab(headerData: toDoHeader[1]),
          SizedBox(width: 20),
          ToDoTab(headerData: toDoHeader[2]),
        ],
      ),
    );
  }
}
