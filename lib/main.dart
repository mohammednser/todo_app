import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/provider/shared_preferences_todos_provider.dart';
import 'package:todo_app/provider/todos.dart';

import 'page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
   WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
 
  runApp(ToDoApp(prefs));
}

class ToDoApp extends StatelessWidget {
  //  const ToDoApp({Key key, }) : super(key: key);
  final SharedPreferences _prefs;
     const ToDoApp(this._prefs, {Key key}) : super(key: key);
  
  static const String title='Todo App';

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:(BuildContext context) => SharedPreferencesTodosProvider(_prefs),
        ),
      //   ChangeNotifierProvider<TodosProvider>(
      //  create: (_) => TodosProvider(),   
      //  )   
      ],
      
      // child: ChangeNotifierProvider(
      //   create:(BuildContext context) => SharedPreferencesTodosProvider(_prefs),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: const Color(0xFFf6f5ee),
          ),
          home:  const HomePage(),
        ),
      );
    
    
  }
}
