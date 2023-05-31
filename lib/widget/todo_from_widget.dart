

import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget( {Key key, 
     
      this.title='',
      this.description='',
       this.onChangedTitle, 
       this.onChangedDescription, 
       this.onSavedTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
       buildTitle(),
        const SizedBox(height: 8),
       buildDescription(),
      const SizedBox(height: 8),
       buildButton()
        ],
      ),
    );
  }
  Widget buildTitle() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The Title is required ';
          } 
            return null;
        },
      decoration:const InputDecoration(
        border:  UnderlineInputBorder(),
        labelText: 'Title',
      ),
    );
   Widget buildDescription() => TextFormField(
        initialValue: description,
        maxLines: 5,
        onChanged: onChangedDescription,
        validator: (description) {
          if (description.isEmpty) {
            return 'The Description is required ';
          } else {
            return null;
          }
        },
      decoration:const InputDecoration(
        border:  UnderlineInputBorder(),
        labelText: 'Description',
      ),
    );
    Widget buildButton()=>SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: onSavedTodo, 
        child:const Text('Save' ,style: TextStyle(color: Colors.white),), 
       
        ),
    );
  }
  