import 'package:flutter/material.dart';

import '../main.dart';
import '../widget/add_todo_dialogl.dart';
import '../widget/completed_list_widger.dart';
import '../widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 int  selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(ToDoApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex, 
        onTap: (index) => setState(() {
          selectedIndex = index;
        }), 
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined,size: 28,),
            label: 'Todos',
             ),
               BottomNavigationBarItem(
            icon:Icon(Icons.done,size: 28,),
             label: 'Completed',
             ),
        ],
       
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          builder: (context) => const AddTodoDialogWidget(), context: context,
          barrierDismissible: false,
           ),
        child: const Icon(Icons.add),
      ),
    );
  }
}