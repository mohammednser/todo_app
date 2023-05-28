import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  
  final List<Todo>   _todos = [
    Todo(
        createdTime: DateTime.now(),
        title:'''
Todo App Flutter''',
description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
       Todo(
        createdTime: DateTime.now(),
        title:'Todo App Flutter',
        description: 'Todo App Flutter\nTodo App Flutter\nTodo App Flutter\nTodo App Flutter'
       ),
  ];
  List<Todo> get todos =>_todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone == true).toList();
   void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
   }

   void removeTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
   }

   bool toggleTodoStatus(Todo todo){
   todo.isDone = !todo.isDone;
   notifyListeners();
   return todo.isDone;
   }

   void updateTodo(Todo todo , String title , String description){
         todo.title= title;
         todo.description=description;

         notifyListeners();
   }
}