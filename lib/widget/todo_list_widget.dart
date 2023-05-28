import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

import '../model/todo.dart';


class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<TodosProvider>(context);
  final todos= provider.todos;

    return  todos.isEmpty? const Center(
      child:Text('No Todos',
            style: TextStyle(fontSize: 20),
            ),
    )
    : ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final todo= todos[index];
        return TodoWidget(todo: todo,);
      }, 
  
    itemCount: todos.length,
    
     separatorBuilder: ( context,  index) {
      return Container(height: 8,);
        },
        
       );
  }
}