import 'package:dev_what_todo/models/todo.dart';
import 'package:dev_what_todo/provider/todos.dart';
import 'package:dev_what_todo/widget/todo_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  late Todo todo;

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Todo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: () {
              const uuid = Uuid();
              final uuidTodo = uuid.v4();
              todo = Todo(
                  createdTime: DateTime.now(),
                  description: description,
                  id: uuidTodo,
                  title: title);
              provider.saveTodo(todo);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
