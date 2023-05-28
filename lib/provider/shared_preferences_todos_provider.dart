import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/todo.dart';

class SharedPreferencesTodosProvider extends ChangeNotifier {
  final SharedPreferences _preferences;
  final List<Todo> _todos;

  SharedPreferencesTodosProvider(this._preferences)
      : _todos = _decodeTodos(_preferences.getStringList('todos') ?? []);

  static List<Todo> _decodeTodos(List<String> list) {
    return list.map((e) => Todo.fromJson(json.decode(e))).toList();
  }

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    _saveTodos();
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    _saveTodos();
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    _saveTodos();
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description =description;
    _saveTodos();
    notifyListeners();
  }

  void _saveTodos() {
    final List<String> encodedTodos =
        _todos.map((todo) => json.encode(todo.toJson())).toList();
    _preferences.setStringList('todos', encodedTodos);
  }
}