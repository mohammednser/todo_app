import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';

import 'todo_widget.dart';


class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<TodosProvider>(context);
  final todos= provider.todosCompleted;

    return  todos.isEmpty? const Center(
      child:Text('No Completed Task',
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