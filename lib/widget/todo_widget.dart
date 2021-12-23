import 'package:dev_what_todo/models/todo.dart';
import 'package:dev_what_todo/page/edit_todo_page.dart';
import 'package:dev_what_todo/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () => editTodo(context, todo),
            caption: 'Edit',
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap: () => deleteTodo(context, todo),
            icon: Icons.delete,
          )
        ],
        child: buildTodo(context),
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    //final todos = provider.todos;

    return GestureDetector(
      onTap: () => editTodo(context, todo),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.updateTodoIsDone(todo.id);

                /* Utils.showSnackBar(
                  context,
                  isDone ? 'Task completed' : 'Task marked incomplete',
                ); */

              },
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: const TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                      )
                  ],
                )),
          ],
        ),
      ),
    );

  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    //Todo: Criar classe Utils
    //Utils.showSnackBar(context, 'Deleted the Task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }
}
