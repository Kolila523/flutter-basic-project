import 'package:flutter/material.dart';
import 'package:project_starter_pack/pages/todo/widgets/list_table.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ListTable());
  }
}
