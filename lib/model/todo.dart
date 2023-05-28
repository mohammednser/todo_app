
import 'package:flutter/material.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

 class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
   @required  this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false, 
    completed,
  });

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
    //  completed: json['completed'], 
      description:json['description'] ,

    );
  }
   // تحويل كائن Todo إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
}
}