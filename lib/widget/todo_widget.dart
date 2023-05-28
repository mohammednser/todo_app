

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/utils.dart';

import '../model/todo.dart';
import '../page/edit_todo_page.dart';
import '../provider/shared_preferences_todos_provider.dart';


class TodoWidget extends StatelessWidget {
 final Todo todo;
  const TodoWidget({Key key, 
   @required  this.todo,
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
       key: Key(todo.id),
       startActionPane: ActionPane(
         key: Key(todo.id),
          extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                label: 'Edit',
                backgroundColor: Colors.green,
                icon: Icons.edit,
                onPressed: (context) { 
                  editTodo(context,todo);
                },
                
              ),
            ],
           ),
            endActionPane: ActionPane(
         key: Key(todo.id),
          extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                label: 'Delete',
                backgroundColor: Colors.red,
                icon: Icons.delete_rounded,
                onPressed: (context) { 
                  deleteTodo(context,todo);
                },
                
              ),
            ],
            ),
           child: buildTodo(context),
       
       
       ),
    );

  }
    Widget buildTodo(BuildContext context) {
     return GestureDetector(
      onTap: () => editTodo(context, todo),
       child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone, 
                onChanged: (_){
                  final provider = Provider.of<SharedPreferencesTodosProvider>(context,listen: false);
                  final isDone= provider.toggleTodoStatus(todo);
                  Utils.showSnackBar(context, 
                   isDone ? 'Task completed' :'Task marked uncompleted',
                    
                  );
                },),
                 const SizedBox(width: 20,),
                Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if(todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top:4),
                    child: Text(
                      todo.description,
                      style: const TextStyle(fontSize: 20,height: 1.5),
                    ),
                  )
                ],
                ))
            ],
          ),
     
        ),
     );
}

  deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<SharedPreferencesTodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context,'Deleted the Task');
  }
  
   void editTodo(BuildContext context, Todo todo,) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo,),
        ),
      );
   
}

 
