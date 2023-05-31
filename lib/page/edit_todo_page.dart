
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/page/home_page.dart';
import 'package:todo_app/widget/todo_from_widget.dart';

import '../provider/todos_provider.dart';


class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, this.todo}) : super(key: key);

  @override
 State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
   final _formKey = GlobalKey<FormState>();

  String title;
  String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text('Edit Todo',style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete , color: Colors.red,),
              onPressed: () {
                showDialog(context: context,
                 builder: (context) =>AlertDialog(
                  title:Text("Warning!!!"),
                    content: Text("Are you sure to delete?" , style: TextStyle(color: Colors.red),), 
                    actions: [
                      TextButton(child: Text('CANCEL'),
                       onPressed: () => Navigator.of(context).pop() ,
                      ),
                       TextButton(child: Text('Delete' , style: TextStyle(color: Colors.red)),
                       onPressed: () {
                        
                        final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                        provider.removeTodo(widget.todo);
                        Navigator.of(context).pop() ;
                        Navigator.of(context).pop() ;
                 
               } 
               
              ),
                
                    ],  
                 )
                 );
                // final provider =
                //     Provider.of<TodosProvider>(context, listen: false);
                // provider.removeTodo(widget.todo);
                 
                // Navigator.of(context).pop();
              },
            )
          ],
        ),
  
  
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              ///  error
              description: description,
              title: title,
              
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: saveTodo,
              
            ),
          ),
        ),
      );
  
      
  
  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo,title,description);

      Navigator.of(context).pop();
      
    }
  }
}


