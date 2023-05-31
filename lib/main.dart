
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/page/screens/home_screen.dart';
import 'package:todo_app/page/screens/intro_screen.dart';



import 'package:todo_app/provider/todos_provider.dart';

import 'nav_bar.dart';
import 'page/home_page.dart';
import 'page/screens/auth_screen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
 
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
    const ToDoApp({Key key, }) : super(key: key);
  
  
  static const String title='Todo App';

  @override
  Widget build(BuildContext context) {
    
    return  MultiProvider(
      providers: [
       
        ChangeNotifierProvider<TodosProvider>(
       create: (_) => TodosProvider(),   
       )   
      ],
      
        child:  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              scaffoldBackgroundColor: const Color(0xFFf6f5ee),
            ),
            home:     IntroScreen(),
              routes: {
          'intro': (context) => IntroScreen(),
          'home': (context) =>  HomePage(),
          'login': (context) => const AuthScreen(authType: AuthType.login),
          'register': (context) => const AuthScreen(authType: AuthType.register),
              },
          ),
        );
     
      
    
    
  }

}
