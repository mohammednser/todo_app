

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context,String text){
      // Scaffold.of(context)
      // ..removeCurrentSnackBar()
      // ..showSnackBar(context,Text(text));
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 2),
  ),
);
  }
  static DateTime toDateTime(Timestamp value){
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date){
    if(date == null) return null;

    return date.toUtc();
  }
  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final objects = snaps.map((json) => fromJson(json)).toList();

          sink.add(objects);
        },
      );
  
}