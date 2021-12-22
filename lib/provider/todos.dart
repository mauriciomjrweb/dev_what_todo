import 'package:dev_what_todo/models/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  late List<Todo> _todos = [
    Todo(
      title: 'Buy Food',
      createdTime: DateTime.now(),
      id: '1',
      description: '''- Eggs 
      - Milk 
      - Bread 
      - Water''',
    ),
    Todo(
      id: '2',
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels 
      - Rent a car 
      - Pack suitcase''',
    ),
    Todo(
      id: '3',
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Todo(
      id: '4',
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
      isDone: true,
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void saveTodo(Todo newTodo) {
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodoIsDone(String todoId, bool isDone) {
    int indexTodo = _todos.indexWhere((element) => element.id == todoId);
    final Todo todo = Todo(
      title: _todos[indexTodo].title,
      createdTime: _todos[indexTodo].createdTime,
      id: _todos[indexTodo].id,
      isDone: isDone,
      description: _todos[indexTodo].description,
    );
    _todos.removeAt(indexTodo);
    saveTodo(todo);
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
  }

  void updateTodo(Todo todo, title, description) {
    int indexTodo = _todos.indexWhere((element) => element.id == todo.id);

    final todoupdate = Todo(
      title: title,
      createdTime: _todos[indexTodo].createdTime,
      id: _todos[indexTodo].id,
      isDone: _todos[indexTodo].isDone,
      description: description,
    );

    _todos.removeAt(indexTodo);
    saveTodo(todoupdate);
  }
}
