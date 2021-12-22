import 'package:dev_what_todo/main.dart';
import 'package:dev_what_todo/models/todo.dart';
import 'package:dev_what_todo/widget/add_todo_dialog_widget.dart';
import 'package:dev_what_todo/widget/todo_form_widget.dart';
import 'package:dev_what_todo/widget/todo_list_widget.dart';
import 'package:flutter/material.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();

}

class _EditTodoPageState extends State<EditTodoPage> {

  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
      ),
    );
  }
}
