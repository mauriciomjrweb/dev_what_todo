import 'dart:js';

import 'package:dev_what_todo/provider/todos.dart';
import 'package:dev_what_todo/widget/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final bool todosCompleted;

  const TodoListWidget({Key? key, required this.todosCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);

    final todos = (todosCompleted) ? provider.todosCompleted : provider.todos;

    return todos.isEmpty
        ? const Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
