import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';

import 'package:todo_app/widget/todo_from_widget.dart';

import '../main.dart';
import '../provider/todos_provider.dart';


class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key key,}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
 final _formkey = GlobalKey<FormState>();
 String title = '';
 String description = '';
 
  @override
  Widget build(BuildContext context)=>AlertDialog(

    content:Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const 
          Text('Add Todo',
          style: TextStyle(
            color:Colors.cyan,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          ),
          const SizedBox(height: 8),
          TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                 onChangedDescription: (description) =>
                     setState(() => this.description = description),
                onSavedTodo:  addTodo ,
                
              ),
        ],
      ),
    )
  ); 
    
    


void addTodo() {
   final isValid = _formkey.currentState.validate() ;
  if (!isValid) {
     return;
  } else {
     final todo = Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(), 
      title: title,
      description: description,
      );
    final provider = Provider.of<TodosProvider>(context,listen:false);
    provider.addTodo(todo);
    Navigator.of(context).pop();
    
  }
}
}
